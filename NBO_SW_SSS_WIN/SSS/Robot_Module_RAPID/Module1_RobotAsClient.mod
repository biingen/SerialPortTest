MODULE Module1
    CONST robtarget Target_40:=[[57.65818726,100,0],[0.707106781,0,0.707106781,0],[-1,-2,2,0],[129.72972973,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_10:=[[57.65818726,377.8,0],[0.707106781,0,0.707106781,0],[-1,-1,1,0],[129.72972973,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_20:=[[211.64177814,377.800008224,0.000002312],[0.707106783,0.000000003,0.70710678,-0.000000003],[0,-2,1,0],[127.18000641,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_30:=[[211.64181274,100,0],[0.707106781,0,0.707106781,0],[0,-2,1,0],[129.72972973,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_50:=[[57.65818726,377.8,0],[0.707106781,0,0.707106781,0],[-1,-2,2,0],[129.72972973,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_60:=[[57.658197287,377.799993911,143.361686668],[0.707106722,0.000000065,0.70710684,0.000000014],[-1,-1,1,0],[129.7297301,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_70:=[[57.65816889,377.800038499,215.640812181],[0.707106719,0.000000011,0.707106844,0.00000007],[-1,-1,1,0],[129.729737019,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    VAR socketdev socketToServer;
    CONST string serverIp:="10.62.32.96"; !"127.0.0.1";
    CONST num PortNum:=8025;
    VAR socketstatus state;
    VAR string recvString:="";
    VAR string send_string:="";
    VAR bool keep := TRUE;
    VAR intnum cnt:=0;
    
    PROC CM_RECTANGLE()
        MoveJ Target_60,v100,fine,Flathead\WObj:=Workobject_1;
        MoveL Target_10,v100,fine,Flathead\WObj:=Workobject_1;
        MoveL Target_20,v100,fine,Flathead\WObj:=Workobject_1;
        MoveL Target_30,v100,fine,Flathead\WObj:=Workobject_1;
        MoveL Target_40,v100,fine,Flathead\WObj:=Workobject_1;
        MoveL Target_50,v100,fine,Flathead\WObj:=Workobject_1;
        MoveJ Target_70,v100,fine,Flathead\WObj:=Workobject_1;
        
        recvString:=recvString+"_RobotDone";
        SocketSend socketToServer \Str:= recvString;
    ENDPROC
    
    PROC TM_CIRCLE()
        MoveJ Target_60,v100,fine,Flathead\WObj:=Workobject_1;
        MoveL Target_10,v100,fine,Flathead\WObj:=Workobject_1;
        MoveL Target_20,v100,fine,Flathead\WObj:=Workobject_1;
        MoveL Target_30,v100,fine,Flathead\WObj:=Workobject_1;
        MoveL Target_40,v100,fine,Flathead\WObj:=Workobject_1;
        MoveL Target_50,v100,fine,Flathead\WObj:=Workobject_1;
        MoveJ Target_70,v100,fine,Flathead\WObj:=Workobject_1;
        
        recvString:=recvString+"_RobotDone";
        SocketSend socketToServer \Str:= recvString;
    ENDPROC
    
    !***********************************************************
    ! Procedure main
    !   This is the entry point of your program
    !***********************************************************
    PROC main()
        !Add your code here
        SocketCreate socketToServer;
        SocketConnect socketToServer,serverIp,PortNum\Time:=WAIT_MAX;

        WHILE keep DO
        SocketReceive socketToServer\str:=recvString;
        % recvString %;
        TPWrite "client received: "+recvString;
        cnt:=cnt+1;
        ENDWHILE
        
        SocketClose socketToServer;
        
    ENDPROC
ENDMODULE