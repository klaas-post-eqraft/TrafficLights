//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "WatchdogDias"
	Revision           = "2.11"
	GUID               = "{169C29BA-AD8E-4C05-843C-02A9D6541EA7}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "true"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	IconPath           = ".\Class\Tool.ico"
	SharedCommandTable = "true"
	Objectsize         = "(284,120)">
	<Channels>
	</Channels>
	<RevDoku>
		<Owner/>
		<Dokumentation Revision="2.11" Date="10.05.2016" Author="RamAnd" Company="Sigmatek" Description="Suppressed warning that would occur with target ARM on compiler version 30 or higher."/>
		<Dokumentation Revision="2.10" Date="05.12.2013" Author="FucHer" Company="Sigmatek" Description="Changed AWL code to Structured Text."/>
		<Dokumentation Revision="1.9" Date="20.07.2012" Author="ObeChr" Company="Sigmatek" Description="Implemented time measurement for internal tests in methods UpdateRt, UpdateRtPostScan and UpdateCy"/>
		<Dokumentation Revision="1.8" Date="22.07.2010" Author="wocpet" Company="Sigmatek" Description="changes in base class: new client &quot;Required&quot;  added"/>
	</RevDoku>
	<Network Name="WatchdogDias">
		<!-- List of Components in this network -->
		<Components>
			<Object
				Name       = "_base"
				GUID       = "{4E3F36BE-6E98-48A6-B4EA-FAB8FBD45129}"
				Class      = "HwBaseCDIAS"
				Position   = "(180,180)"
				Visualized = "true">
				<Channels>
					<Server Name="SerialNo"/>
					<Server Name="State"/>
					<Client Name="MasterConnect"/>
					<Client Name="Place" Value="0"/>
					<Client Name="Required" Value="1"/>
					<Client Name="TimeBase" Value="0"/>
					<Client Name="TimeBaseOffset" Value="0"/>
					<Client Name="To_StdLib"/>
				</Channels>
			</Object>
		</Components>
		<Comments>
		</Comments>
		<!-- List of Connections in this network -->
		<Connections>
			<Connection Source="this.State" Destination="_base.State" Vertices="(652,210),(480,270),"/>
			<Connection Source="_base.MasterConnect" Destination="this.MasterConnect" Vertices="(180,270),(38,210),"/>
			<Connection Source="_base.Place" Destination="this.Place" Vertices="(180,330),(38,270),"/>
		</Connections>
		<!-- Headerfiles -->
		<Options>
		</Options>
	</Network>
</Class>
*)
#pragma using HwBaseCDIAS

WatchdogDias : CLASS
: HwBaseCDIAS
  //Servers:
  //Clients:
  //Variables:
		firstscan 	: USINT;
		direct 	: BOOL;			//! <Variable Comment="direct hardware = 1 | im = 0" Name="direct"/>
		timestamp 	: UDINT;
		HandleCall 	: DINT;
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL Init;
	
	FUNCTION VIRTUAL GLOBAL UpDataCY
		VAR_INPUT
			Handle 	: UDINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL UpDateRT
		VAR_INPUT
			Handle 	: UDINT;
		END_VAR;
	
	FUNCTION AWL VIRTUAL GLOBAL UpDateRT_AWL
		VAR_INPUT
			handle 	: UDINT;
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

//}}LSL_DECLARATION


FUNCTION GLOBAL TAB WatchdogDias::@CT_
0$UINT,
2#0100000000000000$UINT, //TY_WATCHDOGDIAS
2$UINT, 11$UINT, (SIZEOF(::WatchdogDias))$UINT, 
0$UINT, 0$UINT, 0$UINT, 
TO_UDINT(1573657038), "WatchdogDias", //Class
TO_UDINT(1800499398), "HwBaseCDIAS", 2$UINT, 56$UINT, //Baseclass
//Servers:
//Clients:
END_FUNCTION


#define USER_CNT_WatchdogDias 30

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_WatchdogDias] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION WatchdogDias::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
		nCmdSize	: UINT;
	END_VAR

	ret_code	:= HwBaseCDIAS::@STD();
	IF ret_code <> C_OK THEN
		RETURN;
	END_IF;
	nCmdSize		:= HwBaseCDIAS::State.pMeth^.nCmds$UINT*SIZEOF(pVoid) + CMDMETH.Init;

	_memcpy((#vmt.CmdTable)$^USINT, HwBaseCDIAS::State.pMeth, nCmdSize);
	vmt.CmdTable.nCmds		:= nSTDCMD + USER_CNT_WatchdogDias;
	vmt.CmdTable.Init		:= #Init();
#pragma warning (disable : 74)
	vmt.UserFcts[0]		:= #UpDataCY();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[1]		:= #UpDateRT();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[29]		:= #UpDateRT_AWL();

#pragma warning (default : 74)
	HwBaseCDIAS::State.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF HwBaseCDIAS::State.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION
#pragma using DiasMaster


//*********************Inserted from .\WatchdogDias\WatchdogDias_00_00.st*********************



 



(***********************************************************************************
*
*	Class to trigger the watchdog on Diasbus
*		If there is any modul on the Diasbus this Class is triggering the watchdog
*		But this class is only for IM (Watchdogtrigger on normal master is in DiasMasterMain - Class)
*	Created : BS / 2003
*	Changes :
*		0.7 => 1.7 / 23.12.2004 / no Mark / ws
*			compatibility with Lasal Class 2
*			removed visible flags from internal servers
*		0.6 => 0.7 / 18.10.2004 / Mark : // #BS001
*			Now there is a define to set the watchdogtime to max (DiasMasterC\MasterSettings.h "define MaxWatchdog")
*		0.5 => 0.6 / 24.07.2004 
*			Connect Client "Place" of HwBaseCDIAS out to a Client of WatchdogDias
*		0.4 => 0.5 / 23.12.2003 / Mark : // #BS000
*			Programm install now in the 10th init case, cause a read kennung shouldn't be the first call in IM
*		0.3 => 0.4
*			Set the program to a Realtime (could be that the Cyclic take longer than 130 ms)
*		0.2 => 0.3
*			The programm was intalled on in cyclic but only the realtime was 
*			programmed => so there was no watchdotrigger
*
***********************************************************************************)

FUNCTION VIRTUAL GLOBAL WatchdogDias::Init
VAR
	i			:	USINT;
	modulnumber	:	USINT;
END_VAR
	
//============================ Profiler start======================================================
#ifdef DM_Profiler 
  InitTimeMeasurement(usMode := DMTIME_RT);
  InitTimeMeasurement(usMode := DMTIME_CY);
#endif
//============================ Profiler end========================================================  
  
	firstscan += 1;// #BS000
	IF firstscan = 10 THEN// #BS000
//		firstscan := 1;// #BS000

		// scan for first modul
		modulnumber := 16#FF;
		FOR i := 0 TO 63 DO
			IF _DiasConfig[i] <> 16#FF THEN
				modulnumber := i;		
				EXIT;
			END_IF;
		END_FOR;
		
		// if there is any modul we create a realtime prog.
		direct := MasterConnect.GetMasterType() <> 2;
		State.uiIO_Flags := 0;
		IF modulnumber <> 16#FF THEN

			IF direct THEN
				// watchdog in DiasMasterC Class
			ELSE
			  #IFDEF MaxWatchdog // #BS001
			    HandleCall := MasterConnect.AddCall2Main(Mode:=1, DMRealtime, this);// #BS001
			  #ELSE// #BS001
			    HandleCall := MasterConnect.AddCall2Main(Mode:=2, DMRealtime, this);
			  #ENDIF// #BS001
				MasterConnect.AddRdKenn(modulnumber$HSINT, DMRealtime, this);
				MasterConnect.AddRet(RTCY:=DMRealtime);
				timestamp := ops.tAbsolute - 200;
			END_IF;

		ELSE
			State.uiIO_Flags.PhysicAccessOff	:= 1;
			State.uiIO_Flags.NoHW				:= 1;
		END_IF;

	END_IF;

END_FUNCTION //VIRTUAL GLOBAL WatchdogDias::Init

FUNCTION VIRTUAL GLOBAL WatchdogDias::UpDateRT
VAR_INPUT
	handle		: UDINT;
END_VAR

//============================ Profiler start======================================================
#ifdef  DM_Profiler								
  StartTimeMeasurement(usMode:=DMTIME_RT);
#endif	
//============================ Profiler end======================================================== 

  #IFDEF MaxWatchdog	// #BS001
  #ELSE					// #BS001

  if ops.tAbsolute - timestamp >= 100 then
    timestamp := ops.tAbsolute;
    (_IOSegment$^SINT+HandleCall)^ := DMSingle;
  end_if;

  #ENDIF				// #BS001

//============================ Profiler start======================================================
#ifdef  DM_Profiler								
  StopTimeMeasurement(usMode:=DMTIME_RT);
#endif	
//============================ Profiler end======================================================== 

END_FUNCTION //VIRTUAL GLOBAL WatchdogDias::UpDateRT

FUNCTION AWL VIRTUAL GLOBAL WatchdogDias::UpDateRT_AWL
VAR_INPUT
	handle		: UDINT;
END_VAR
#ifdef _LSL_TARGETARCH_X86

//============================ Profiler start======================================================
#ifdef  DM_Profiler								
  l.eax   DMTIME_RT
  call    StartTimeMeasurement
#endif	
//============================ Profiler end======================================================== 

  #IFDEF MaxWatchdog	// #BS001
  #ELSE					// #BS001

	L.EAX		ops.tAbsolute
	SUB.EAX		timestamp
	CMP.EAX		100 //ms 
	JB			NOCall
	
	L.EAX		ops.tAbsolute
	S.EAX		timestamp

	L.EDI		_IOSegment
	L.EBX		HandleCall

	L.B			(EDI+EBX),DMSingle
NOCall

  #ENDIF				// #BS001

//============================ Profiler start======================================================
#ifdef  DM_Profiler								
  l.eax   DMTIME_RT
  call    StopTimeMeasurement
#endif	
//============================ Profiler end======================================================== 
#endif
END_FUNCTION //VIRTUAL GLOBAL WatchdogDias::UpDateRT

FUNCTION VIRTUAL GLOBAL WatchdogDias::UpDataCY
VAR_INPUT
	Handle		: UDINT;
END_VAR

//============================ Profiler start======================================================
#ifdef  DM_Profiler								
  StartTimeMeasurement(usMode := DMTIME_CY);
#endif	
//============================ Profiler end========================================================

	UpDateRT(handle);

//============================ Profiler start======================================================
#ifdef  DM_Profiler								
  StopTimeMeasurement(usMode := DMTIME_CY);
#endif	
//============================ Profiler end========================================================

END_FUNCTION //VIRTUAL GLOBAL WatchdogDias::UpDataCY

