#ifndef _APIDATABASE_H
#define _APIDATABASE_H

#include "DatabaseWorkerPool.h"
#include "MySQLConnection.h"

class APIDatabaseConnection : public MySQLConnection
{
    public: 
        APIDatabaseConnection(MySQLConnectionInfo& connInfo) : MySQLConnection(connInfo) { }
        APIDatabaseConnection(ACE_Activation_Queue* q, MySQLConnectionInfo& connInfo) : MySQLConnection(q, connInfo) { }
        void DoPrepareStatements();
};

typedef DatabaseWorkerPool<APIDatabaseConnection> APIDatabaseWorkerPool;

enum APIDatabaseStatements
{ 
    //API_SEL_XXX,
    MAX_APIDATABASE_STATEMENTS,
};

#endif
