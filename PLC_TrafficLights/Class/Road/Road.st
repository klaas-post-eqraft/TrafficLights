//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "Road"
	Revision           = "0.0"
	GUID               = "{54A52D83-5F41-43A2-8604-50A1BA7307DB}"
	RealtimeTask       = "false"
	CyclicTask         = "true"
	DefCyclictime      = "100 ms"
	BackgroundTask     = "false"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(752,120)">
	<Channels>
		<Server Name="ClassSvr" GUID="{39167C79-0530-4A1E-BF4F-A9DF15F7CA3C}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="Svr_AverageWaitingTime" GUID="{A51146D1-F663-469E-9B53-69CE114E98D1}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="Svr_IncomingCars" GUID="{C0CECF47-6DEA-4296-B811-DBAF2D9D0E9F}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Server Name="Svr_PassingTime" GUID="{47ACCEB2-7694-41B8-BF42-2D13B356BA57}" Visualized="false" Initialize="true" DefValue="1200" WriteProtected="false" Retentive="SRam"/>
		<Server Name="Svr_TotalCarsPassed" GUID="{E4E8C96C-F8D1-4104-9612-CF2FCA6B2A92}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Client Name="I_TrafficLight" Required="false" Internal="false"/>
	</Channels>
	<RevDoku>
		<Owner Company="Eqraft"/>
		<Dokumentation Revision="0.1.0" Date="2024-06-20" Author="Klaas Post" Company="Eqraft"/>
	</RevDoku>
</Class>
*)
Road : CLASS
  //Servers:
	ClassSvr 	: SvrChCmd_DINT;
	Svr_IncomingCars 	: SvrCh_DINT;
	Svr_TotalCarsPassed 	: SvrCh_DINT;
	Svr_AverageWaitingTime 	: SvrCh_REAL;
	Svr_PassingTime 	: SvrCh_UDINT;
  //Clients:
	I_TrafficLight 	: CltCh__LightColor_PTofCls_TrafficLight;
  //Variables:
		tLastCarPassed 	: UDINT;
		TotalWaitingTime 	: UDINT;
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL CyWork
		VAR_INPUT
			EAX 	: UDINT;
		END_VAR
		VAR_OUTPUT
			state (EAX) 	: UDINT;
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

//}}LSL_DECLARATION


FUNCTION GLOBAL TAB Road::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_ROAD
0$UINT, 0$UINT, (SIZEOF(::Road))$UINT, 
5$UINT, 1$UINT, 0$UINT, 
TO_UDINT(2740267269), "Road", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::Road.ClassSvr.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(619352855), "ClassSvr", 
(::Road.Svr_IncomingCars.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(706216677), "Svr_IncomingCars", 
(::Road.Svr_TotalCarsPassed.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(1393295131), "Svr_TotalCarsPassed", 
(::Road.Svr_AverageWaitingTime.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(843986990), "Svr_AverageWaitingTime", 
(::Road.Svr_PassingTime.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000001000$UINT, TO_UDINT(1595934702), "Svr_PassingTime", 
//Clients:
(::Road.I_TrafficLight.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000000$UINT, TO_UDINT(1043360495), "I_TrafficLight", 
END_FUNCTION


#define USER_CNT_Road 0

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_Road] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION Road::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_Road, pCmd := #vmt.CmdTable);
	vmt.CmdTable.CyWork		:= #CyWork();
	ClassSvr.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF ClassSvr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	Svr_IncomingCars.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF Svr_IncomingCars.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	Svr_PassingTime.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF Svr_PassingTime.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION
//----------------------------------------------------------------------------------------------------
//  Standard class methods
//----------------------------------------------------------------------------------------------------

// Standard Cywork, runs every set amount of time. 
FUNCTION VIRTUAL GLOBAL Road::CyWork
	VAR_INPUT
		EAX 	: UDINT;
	END_VAR
	VAR_OUTPUT
		state (EAX) 	: UDINT;
	END_VAR
    
    IF OPS.tAbsolute - tLastCarPassed > Svr_PassingTime THEN
    
        // If there's no cars waiting, exit function.
        IF Svr_IncomingCars < 1 THEN
            state := READY;
            RETURN;
        END_IF;
        
        // Car(s) read the traffic light.
        I_TrafficLight := I_TrafficLight.Read();
        
        // If the signal is red, exit function.
        IF I_TrafficLight = TrafficLight::eRed THEN
            TotalWaitingTime += Svr_PassingTime;
            state := READY;
            RETURN;
        END_IF;
        
        // If light is yellow, traffic might pass or might not.
        IF I_TrafficLight = TrafficLight::eYellow & OPS.tAbsolute MOD 5 = 0 THEN
            TotalWaitingTime += Svr_PassingTime;
            RETURN;
        END_IF;
        
        // Car is free to go so decrease incoming traffic by one and add to total of cars passed.
        Svr_IncomingCars -= 1;
        Svr_TotalCarsPassed += 1;
        
        tLastCarPassed := OPS.tAbsolute;
    END_IF;
    
    IF Svr_TotalCarsPassed > 0 THEN
        Svr_AverageWaitingTime := TotalWaitingTime / Svr_TotalCarsPassed;
    ELSE
        Svr_AverageWaitingTime := 0;
    END_IF;
    
	state := READY;

END_FUNCTION
