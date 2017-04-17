/*
 * FireflyCore
 * Voice Chat Engine
 * Copyright (C) 2016 JunkyBulgaria <emiliyan9604bg@gmail.com>
 */

#ifndef _VOICECHATHANDLER_H
#define _VOICECHATHANDLER_H

#include "VoiceChatOpcodes.h"
#include "VoiceChatClientSocket.h"

class VoiceChatClientSocket;
struct VoiceChatChannelRequest
{
    std::string channel_name;
    uint32 team;
    uint32 id;
    uint32 groupid;
};

class VoiceChatHandler// : public ACE_Singleton<VoiceChatHandler>
{
    VoiceChatClientSocket * m_client;
    std::vector<VoiceChatChannelRequest> m_requests;
    uint32 request_high;
    uint32 ip;
    uint16 port;
    time_t next_connect;
    bool enabled;
    std::string ip_s;
public:
    VoiceChatHandler();
    void Startup();
    void Update();
    void SocketDisconnected();
    void OnRead(const uint8 * bytes, uint32 len);

    uint32 GetVoiceServerIP() { return ip; }
    uint16 GetVoiceServerPort() { return port; }
    void CreateVoiceChannel(Channel * chn);
    void DestroyVoiceChannel(Channel * chn);
    bool CanCreateVoiceChannel(Channel * chn);
    bool CanUseVoiceChat();

    void CreateGroupChannel(Group * pGroup);
};

#define sVoiceChatHandler VoiceChatHandler::getSingleton()

#endif        // _VOICECHATHANDLER_H
