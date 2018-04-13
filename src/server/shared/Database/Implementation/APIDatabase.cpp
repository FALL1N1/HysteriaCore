#include "APIDatabase.h"

void APIDatabaseConnection::DoPrepareStatements()
{
    if (!m_reconnecting)
        m_stmts.resize(MAX_APIDATABASE_STATEMENTS);

    //PrepareStatement(API_SEL_XXX, " ", CONNECTION_ASYNC);
}
