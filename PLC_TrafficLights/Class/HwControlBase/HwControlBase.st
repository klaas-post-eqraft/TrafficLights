//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "HwControlBase"
	Revision           = "1.10"
	GUID               = "{25529921-015E-4979-B126-D406D2F83DDD}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "true"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	IconPath           = ".\Class\HwControl\HwControl.ico"
	SharedCommandTable = "true"
	Objectsize         = "(652,120)"
	Comment            = "Class to handle VaranManager and the cooperation with DiasMasterC&#13;&#10;BaseClass only contains empty implementation of UpdateRtPostScan">
	<Channels>
		<Server Name="Control" GUID="{6E0C095B-B92D-47BE-BA84-39E07206C58D}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false" Comment="connect VaranManager classes"/>
		<Server Name="DiasMaster" GUID="{346AEDBC-831D-4D5C-B71F-A1BF17D120A4}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false" Comment="connect to DiasMasterC Client if used (if Server is 1 class is connected)"/>
		<Server Name="State" GUID="{662C9213-4BB2-4CC6-AE9F-D19FC74B0F6B}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false" Comment="state of HwControl class"/>
		<Client Name="RtDebug" Required="false" Internal="false" Comment="ATTENTION!!&#13;&#10;If client is activated hardware will be continue to work if a Realtime task is debugged.&#13;&#10;No Watchdog of hardware occures. RtPostScan will be called from RtPreScan which could lead to a different timing behaviour of the machine.&#13;&#10;&#13;&#10;(as Initvalue, default is off)"/>
		<Client Name="To_StdLib" Required="false" Internal="false"/>
		<Client Name="To_TaskObjectControl" Required="false" Internal="false" Comment="is automatically connected to OS class"/>
	</Channels>
	<Dependencies>
		<Files>
			<File Path=".\LSL_STITask.h" Include="false"/>
			<File Path=".\Class\VaranManager_Base\VaranManager_Base.h" Include="false"/>
		</Files>
	</Dependencies>
	<RevDoku>
		<Owner Company="Sigmatek" Author="BleErn"/>
		<Dokumentation Revision="1.10" Date="18.07.2013" Author="RamAnd" Company="Sigmatek" Description="Changed comment of RtDebug: Added warning, that the timing behaviour of the machine could be changed, when this client is set."/>
		<Dokumentation Revision="1.1" Date="27.02.2012" Author="RamAnd" Company="Sigmatek" Description="Added support for the SafetyManager"/>
		<Dokumentation Revision="1.0" Date="08.02.2010" Author="BleErn" Company="Sigmatek" Description="Creation of BaseClass for HwControl for implementation of HwRtPostScan"/>
	</RevDoku>
</Class>
*)
HwControlBase : CLASS
	TYPE
	  pVaranManager : ^VaranManager;
	  t_DMFunctions : STRUCT
	    p_RtFunction : ^void;
	    p_SendSync : ^void;
	    p_FinishIMProg : ^void;
	    p_LastInit : ^void;
	    p_This : ^void;
	    sd_PllTime : DINT;
	    ud_DiasTime : UDINT;
	    sd_RtDebug : DINT;
	    sd_Reserved2 : DINT;
	    sd_Reserved3 : DINT;
	  END_STRUCT;
	  t_DiasMaster : STRUCT
	    ud_Counter : UDINT;
	    p_Functions : ^HwControlBase::t_DMFunctions;
	  END_STRUCT;
	  t_VMFunctions : STRUCT
	    p_This : ^VaranManager;
	    ud_VaranTime : UDINT;
	    b_IsAlsoClient : BOOL;
	    ud_SuperiorTime : UDINT;
	    b_HWClassSynchron : BOOL;
	    b_OverrideFrameCheck : BOOL;
	  END_STRUCT;
	  t_OneVaranManager : STRUCT
	    ud_Counter : UDINT;
	    ud_SuperiorSync : UDINT;
	    ud_SuperiorSyncActual : UDINT;
	    p_Functions : ^HwControlBase::t_VMFunctions;
	  END_STRUCT;
	END_TYPE
  //Servers:
	Control 	: SvrChCmd_DINT;
	State 	: SvrCh_t_e_VaranErrors;
	DiasMaster 	: SvrCh_DINT;
  //Clients:
	To_TaskObjectControl 	: CltChCmd__TaskObjectControl;
	To_StdLib 	: CltChCmd__StdLib;
	RtDebug 	: CltCh_DINT;
  //Variables:
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL UpdateRtPostScan;
	
	FUNCTION VIRTUAL GLOBAL AddSafetyManager
		VAR_INPUT
			pThis 	: pVirtualBase;
		END_VAR
		VAR_OUTPUT
			pFirstVM 	: pVirtualBase;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL DisableSafetyManager;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

#pragma usingLtd _StdLib
#pragma usingLtd _TaskObjectControl


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB HwControlBase::@CT_
0$UINT,
2#0100000000000000$UINT, //TY_HWCONTROLBASE
1$UINT, 10$UINT, (SIZEOF(::HwControlBase))$UINT, 
3$UINT, 3$UINT, 0$UINT, 
TO_UDINT(1193052171), "HwControlBase", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::HwControlBase.Control.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(3533623889), "Control", 
(::HwControlBase.State.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(1422331979), "State", 
(::HwControlBase.DiasMaster.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(2647887450), "DiasMaster", 
//Clients:
(::HwControlBase.To_TaskObjectControl.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000000$UINT, TO_UDINT(2751224004), "To_TaskObjectControl", TO_UDINT(1584830088), "_TaskObjectControl", 1$UINT, 1$UINT, 
(::HwControlBase.To_StdLib.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000000$UINT, TO_UDINT(2139173287), "To_StdLib", TO_UDINT(3689364044), "_StdLib", 0$UINT, 0$UINT, 
(::HwControlBase.RtDebug.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000000$UINT, TO_UDINT(3823771403), "RtDebug", 
END_FUNCTION


#define USER_CNT_HwControlBase 3

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_HwControlBase] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION HwControlBase::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_HwControlBase, pCmd := #vmt.CmdTable);
#pragma warning (disable : 74)
	vmt.UserFcts[0]		:= #UpdateRtPostScan();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[1]		:= #AddSafetyManager();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[2]		:= #DisableSafetyManager();

#pragma warning (default : 74)
	Control.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF Control.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	DiasMaster.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF DiasMaster.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

#pragma usingLtd VaranManager

//{{LSL_IMPLEMENTATION
FUNCTION VIRTUAL GLOBAL HwControlBase::UpdateRtPostScan

END_FUNCTION

#pragma warning(disable: 73)
#pragma warning(disable: 76)
FUNCTION VIRTUAL GLOBAL HwControlBase::AddSafetyManager
	VAR_INPUT
		pThis 	: pVirtualBase;
	END_VAR
	VAR_OUTPUT
		pFirstVM 	: pVirtualBase;
	END_VAR

END_FUNCTION
#pragma warning(default: 73)
#pragma warning(default: 76)

FUNCTION VIRTUAL GLOBAL HwControlBase::DisableSafetyManager

END_FUNCTION
