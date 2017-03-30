#include "ScriptPCH.h"
#include "World.h"

class AccountControl : public PlayerScript
{
public:
	AccountControl() : PlayerScript("AccountControl") { }

   uint32 DoubleID;

	void OnLogin(Player* player)
	{
        return;
		PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_SEL_ACC_CONTR_ID);
		stmt->setInt32(0, player->GetSession()->GetAccountId());

		if (PreparedQueryResult resultAccountID = LoginDatabase.Query(stmt))
		{
			UpdateControl(player, GetActIp(player), GetLastIp(player));
		}
		else InsertControl(player);

		//allow IP if GM
		if (player->GetSession()->GetSecurity() >= SEC_MODERATOR)
			InsertMultipleAccount(player);
		
		//Check for multiple IP's
		//SELECT accountID FROM account_control WHERE accountID != ? AND (act_ip = ? OR last_ip_1 = ? OR last_ip_2 = ?)

		PreparedStatement* stmt2 = LoginDatabase.GetPreparedStatement(LOGIN_SEL_DOUPLE_IP_CHECK);
		stmt2->setInt32(0, player->GetSession()->GetAccountId());
		stmt2->setString(1, player->GetSession()->GetRemoteAddress());
		stmt2->setString(2, player->GetSession()->GetRemoteAddress());
		stmt2->setString(3, player->GetSession()->GetRemoteAddress());

		if (PreparedQueryResult resultDoubleID = LoginDatabase.Query(stmt2))
		{	
			// Return if GM	
			if (player->GetSession()->GetSecurity() >= SEC_MODERATOR)
			{
				return;
			}

			PreparedStatement* stmt3 = LoginDatabase.GetPreparedStatement(LOGIN_SEL_MULITPLEACC);
			stmt3->setString(0, player->GetSession()->GetRemoteAddress());

			//don't ban if ip is allowd
			if (PreparedQueryResult resultMultAcc = LoginDatabase.Query(stmt3))
				if (resultMultAcc->Fetch()->GetInt32() == 1)
					return;

			// don't ban if your account is registered in account_group and not more accounts online than registered
			if (GetAccountGrpId(player) != false)
				if (GetMaxGroupEntry(player) <= GetAccGrpIdRows(player))
					return;
			
			std::string DoubleIP = player->GetSession()->GetRemoteAddress();
			DoubleID = resultDoubleID->Fetch()->GetInt32();
			sWorld->BanAccount(BAN_IP, DoubleIP, "0s", "Mutiple accounts on IP" + DoubleIP, "Server Script");
			sWorld->BanAccount(BAN_ACCOUNT, GetAccountName(player->GetSession()->GetAccountId()), "0s", "Multiple accounts", "Server Script");
			sWorld->BanAccount(BAN_ACCOUNT, GetAccountName(DoubleID), "0s", "Multiple accounts (" + GetAccountName(player->GetSession()->GetAccountId()) + ", " + GetAccountName(DoubleID) + ")", "Server Script");
		}
	
	}

	std::string GetActIp(Player* player)
	{
		std::string ActIp;

		PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_SEL_ACTIP);
		stmt->setInt32(0, player->GetSession()->GetAccountId());
		PreparedQueryResult resultActIp = LoginDatabase.Query(stmt);

		ActIp = resultActIp->Fetch()->GetString();

		return ActIp;
	}

	std::string GetLastIp(Player* player)
	{
		std::string LastIp;

		PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_SEL_LASTIP);
		stmt->setInt32(0, player->GetSession()->GetAccountId());
		PreparedQueryResult resultLastIp = LoginDatabase.Query(stmt);

		LastIp = resultLastIp->Fetch()->GetString();

		return LastIp;
	}

	std::string GetLastIp2(Player* player)
	{
		std::string LastIp2;

		PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_SEL_LASTIP2);
		stmt->setInt32(0, player->GetSession()->GetAccountId());
		PreparedQueryResult resultLastIp2 = LoginDatabase.Query(stmt);

		LastIp2 = resultLastIp2->Fetch()->GetString();

		return LastIp2;
	}

	std::string GetAccountName(uint32 ID)
	{
		std::string AccountName;

		PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_SEL_NAME_BY_ID);
		stmt->setInt32(0, ID);
		PreparedQueryResult resultAccName = LoginDatabase.Query(stmt);

		AccountName = resultAccName->Fetch()->GetString();

		return AccountName;
	}

	bool GetAccountGrpId(Player* player)
	{
		int AccGroupId;
		//SELECT accountGroupID FROM account_group WHERE accountID = ?

		PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_SEL_ACC_GRP_ID);
		stmt->setInt32(0, player->GetSession()->GetAccountId());

		if (PreparedQueryResult resultGrpId = LoginDatabase.Query(stmt))
		{
			AccGroupId = resultGrpId->Fetch()->GetInt32();
			return AccGroupId;
		} else return false;
	}

	bool GetMaxGroupEntry(Player* player)
	{
		int MaxEntry;

		//SELECT MAX(accountGroupEntry) FROM account_group WHERE accountGroupID = ?

		PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_SEL_ACCGRPNUM);
		stmt->setInt32(0, GetAccountGrpId(player));
		PreparedQueryResult resultMaxEntry = LoginDatabase.Query(stmt);

		MaxEntry = resultMaxEntry->Fetch()->GetInt32();

		return MaxEntry;
	}

	bool GetAccGrpIdRows(Player* player)
	{
		int Rows;

		//SELECT accountID FROM account_group WHERE accountGroupID = ?

		PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_SEL_ALL_WITH_ACCGRPID);
		stmt->setInt32(0, GetAccountGrpId(player));
		PreparedQueryResult resultRows = LoginDatabase.Query(stmt);

		Rows = resultRows->GetRowCount();

		return Rows;
	}

	void InsertMultipleAccount(Player* player)
	{
		//INSERT INTO multiple_account(IP, allow_multiple_accounts) VALUES(? , ? )

		PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_REP_MULTIPLEACC);
		stmt->setString(0, player->GetSession()->GetRemoteAddress());
		stmt->setInt32(1, 1);

		LoginDatabase.Execute(stmt);
	}

	void UpdateControl(Player* player, std::string ActIp, std::string LastIp)
	{
		//UPDATE account_control SET act_ip = ?, last_ip#1 = ?, last_ip#2 = ? WHERE accountID = ?

		PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_UPD_IPCHECK);
		stmt->setString(0, player->GetSession()->GetRemoteAddress());
		stmt->setString(1, ActIp);
		stmt->setString(2, LastIp);
		stmt->setInt32(3, player->GetSession()->GetAccountId());

		LoginDatabase.Execute(stmt);
	}

	void InsertControl(Player* player)
	{
		//INSERT INTO account_control (accountID, username, act_ip) VALUES (?, ?, ?)

		PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_INS_IPCHECK);
		stmt->setInt32(0, player->GetSession()->GetAccountId());
		stmt->setString(1, player->GetSession()->GetRemoteAddress());
		LoginDatabase.Execute(stmt);
	}
};

void AddSC_AccountControl()
{
	new AccountControl();
} 