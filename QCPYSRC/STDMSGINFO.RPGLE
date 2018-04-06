       // Standard API Error data structure used with most APIs
     D APIError        DS                  Qualified
     D  BytesProvided                10I 0 inz(%size(APIError))
     D  BytesAvail                   10I 0 inz(0)
     D  MsgId                         7A
     D                                1A
     D  MsgData                     240A
        //----------------------------------------------------------------
        // Message APIs
        //----------------------------------------------------------------
        // Receieve Message from Program Message Queue
     D ReceiveMsg      PR                  ExtPgm('QMHRCVPM')
     D  MsgInfo                    3000    Options(*VarSize)
     D  MsgInfoLen                   10I 0 Const
     D  FormatName                    8    Const
     D  CallStack                    10    Const
     D  CallStackCtr                 10I 0 Const
     D  MsgType                      10    Const
     D  MsgKey                        4    Const
     D  WaitTime                     10I 0 Const
     D  MsgAction                    10    Const
     D  ErrorForAPI                        Like(APIError)
        //----------------------------------------------------------------
        // Dynamic Screen Manager APIs
        //----------------------------------------------------------------
        // Create Input Buffer
     D CreateInputBuffer...
     D                 PR            10I 0 ExtProc( 'QsnCrtInpBuf' )
     D BufferSize                    10I 0 Const
     D Increment                     10I 0 Const Options(*Omit)
     D MaximumSize                   10I 0 Const Options(*Omit)
     D BufferHandle                  10I 0 Options(*Omit)
     D Error                               Like(APIError) Options(*OMIT)
        // Read Screen
     D ReadScreen      PR            10I 0 ExtProc( 'QsnReadScr' )
     D BytesRead                     10I 0 Options( *Omit )
     D BufferHandle                  10I 0 Const Options( *Omit )
     D CmdBufferhandle...
     D                               10I 0 Const Options( *Omit )
     D EnvironmentHandle...
     D                               10I 0 Options( *Omit )
     D Error                               Like(APIError) Options(*OMIT)
        // Retrieve pointer to data in input buffer
     D RetrieveDataPtr...
     D                 PR              *   ExtProc( 'QsnRtvDta' )
     D BufferHandle                  10I 0 Const
     D DataPointer                     *   Options( *Omit )
     D Error                               Like(APIError) Options(*OMIT)
        //----------------------------------------------------------------
        // Base Formats
        //----------------------------------------------------------------
     D DummyPtr        S               *
        // DS returned by QMHRCVPM for format RCVM0300
     D RCVM0300        DS                  Qualified Based(DummyPtr)
     D ByteReturned                  10I 0
     D ByteAvail                     10I 0
     D MsgSeverity                   10I 0
     D MsgId                          7A
     D MsgType                        2A
     D MsgKey                         4A
     D MsgFileName                   10A
     D MsgLibSpec                    10A
     D MsgLibUsed                    10A
     D AlertOption                    9A
     D CCSIDCnvIndText...
     D                               10I 0
     D CCSIDCnvIndData...
     D                               10I 0
     D CCSIDMsg                      10I 0
     D CCSIDReplace                  10I 0
     D LenReplace1                   10I 0
     D LenReplace2                   10I 0
     D LenMsgReturn                  10I 0
     D LenMsgAvail                   10I 0
     D LenHelpReturn                 10I 0
     D LenHelpAvail                  10I 0
     D LenSenderReturn...
     D                               10I 0
     D LenSenderAvail...
     D                               10I 0
     D MsgData                     5000A
        // Sender structure returned in RCVM0300
     D RCVM0300SndRcvInfo...
     D                 DS                  Qualified Based(DummyPtr)
     D SendingJob                    10A
     D SendIngJobProfile...
     D                               10A
     D SendingJobNo                   6A
     D DateSent                       7A
     D TimeSent                       6A
     D SendingType                    1A
     D ReceivingType                  1A
     D SendingPgm                    12A
     D SendingModule                 10A
     D SendingProcedure...
     D                              256A
     D                                1A
     D NoStateNosSending...
     D                               10I 0
     D StateNosSending...
     D                               30A
     D ReceivingPgm                  10A
     D ReceivingModule...
     D                               10A
     D ReceivingProcedure...
     D                              256A
     D                               10A
     D NoStateNosReceiving...
     D                               10I 0
     D StateNosReceiving...
     D                               30A
     D                                2A
     D LongSendingPgmNameOffset...
     D                               10I 0
     D LongSendingPgmNameLength...
     D                               10I 0
     D LongSendingProcNameOffset...
     D                               10I 0
     D LongReceivingProcNameLength...
     D                               10I 0
     D MicroSeconds                   6A
     D SendingUsrPrf                 10A
     D Names                       4000A
