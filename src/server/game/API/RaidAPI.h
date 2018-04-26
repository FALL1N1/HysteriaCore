class RaidAPI
{
    friend class ACE_Singleton<RaidAPI, ACE_Null_Mutex>;
    RaidAPI();

    public:

        void StartLogging();
        void StopLogging();

    private:
        uint32 startTime; // getMSTime();
};

#define sRaidAPI ACE_Singleton<RaidAPI, ACE_Null_Mutex>::instance()