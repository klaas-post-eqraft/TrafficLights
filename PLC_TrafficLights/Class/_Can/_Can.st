//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "_Can"
	Revision           = "0.4"
	GUID               = "{382F9BA1-77AD-11D6-8832-0048545E88BC}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "true"
	OSInterface        = "true"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(284,120)"
	Comment            = "The OS interface library class _Can can be used to communicate with a CPU or IPC via the CAN bus interface. &#10;&#10;The OS Interface library class _Can is also used by the class _CanLib of the DiasMaster library. &#10;For more information have a look at the _CanLib documentation.">
	<Channels>
		<Server Name="Server0" GUID="{382F9BA2-77AD-11D6-8832-0048545E88BC}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
	</Channels>
	<Dependencies>
		<Files>
			<File Path=".\Source\code\OsiBaseNew.st"/>
			<File Path=".\Source\code\OsiBaseNew.h" Include="false"/>
			<File Path=".\CanTypes.h" Include="false"/>
		</Files>
	</Dependencies>
	<RevDoku>
		<Owner Company="Sigmatek" Author="feshar"/>
		<Dokumentation Revision="0.4" Date="2016-04-12" Author="feshar" Company="Sigmatek" Description="Add ClearMsgQueue, GetControllerState and Restart"/>
	</RevDoku>
</Class>
*)
_Can : CLASS
	TYPE
	  OS_CAN : STRUCT
	    udVersion : UDINT;
	    ISINSTALLED : pVoid;
	    GETMYSTATION : pVoid;
	    SETMYSTATION : pVoid;
	    GETMYBAUDRATE : pVoid;
	    SETMYBAUDRATE : pVoid;
	    CancelReq : pVoid;
	    SetReqTimeout : pVoid;
	    GetProtocolVersion : pVoid;
	    GetCpuStatus : pVoid;
	    GetSysver : pVoid;
	    GetData : pVoid;
	    SetData : pVoid;
	    GetBlockPG : pVoid;
	    SetBlockPG : pVoid;
	    GetDataPG : pVoid;
	    SetDataPG : pVoid;
	    DelCanObj : pVoid;
	    DelBasicCanObj : pVoid;
	    Reserved : pVoid;
	    TxRmtFrame : pVoid;
	    Reserved2 : pVoid;
	    ClearMsgQueue : pVoid;
	    GetControllerState : pVoid;
	    Restart : pVoid;
	  END_STRUCT;
	  OS_SSR : STRUCT
	    InstallIRQ : pVoid;
	    InstallIRQObject : pVoid;
	    CreateMailbox : pVoid;
	    MailboxGet : pVoid;
	    MailboxPut : pVoid;
	    MailboxDelete : pVoid;
	    CreateSemaphore : pVoid;
	    SemSignal : pVoid;
	    SemPulse : pVoid;
	    SemWait : pVoid;
	    SemWaitCond : pVoid;
	    SemDelete : pVoid;
	    OutW : pVoid;
	    OutB : pVoid;
	    InpW : pVoid;
	    InpB : pVoid;
	    MemoryAccess : pVoid;
	    CanTxObj : pVoid;
	    AddCanObj : pVoid;
	    Malloc : pVoid;
	    Free : pVoid;
	    SetSysTime : pVoid;
	    SetSysDate : pVoid;
	    GetSysTime : pVoid;
	    GetSysDate : pVoid;
	    Realloc : pVoid;
	    InstallIRQLasal : pVoid;
	    Memmove : pVoid;
	    Memcpy : pVoid;
	    memset : pVoid;
	    Memcmp : pVoid;
	    LoginIntoCANNew : pVoid;
	    GetObjectInfo : pVoid;
	    dummy1 : pVoid;
	    dummy2 : pVoid;
	    dummy3 : pVoid;
	    dummy4 : pVoid;
	    OSDelaay : pVoid;
	    InstallDiasHandler : pVoid;
	    AddToServiceProvider : pVoid;
	    dummy11 : pVoid;
	    dummy12 : pVoid;
	    EE_read : pVoid;
	    EE_write : pVoid;
	    ButtonPressed : pVoid;
	    SetTimerIntVal : pVoid;
	    GetTimerIntVal : pVoid;
	    dummy20 : pVoid;
	    dummy21 : pVoid;
	    dummy22 : pVoid;
	    PROMGetInfo_socket : pVoid;
	    PROMSetData_Socket : pVoid;
	    PROMGetData_Socket : pVoid;
	    PROMGetInfo_Modul : pVoid;
	    PROMSetData_Modul : pVoid;
	    PROMGetData_Modul : pVoid;
	    PROMGetInfo_Flash : pVoid;
	    PROMSetDataFlash : pVoid;
	    PROMGetData_Flash : pVoid;
	    InitBasicCanObject : pVoid;
	    dummy31 : pVoid;
	    dummy32 : pVoid;
	  END_STRUCT;
	END_TYPE
  //Servers:
	Server0 	: SvrChCmd_DINT;
  //Clients:
  //Variables:
  //Functions:
	
	FUNCTION _Can
		VAR_OUTPUT
			ret_code 	: ConfStates;
		END_VAR;
				//! <Function Comment="Checks weather a CAN-Interface is installed or not." Name="IsInstalled"/>
	FUNCTION __CDECL VIRTUAL GLOBAL IsInstalled
		VAR_INPUT
			CanNR 	: USINT;			//! <Variable Comment="Parameter CanNr specifies the number of the CAN-Interfaces to check (1=CAN1, 2=CAN2, etc.)" Name="IsInstalled.CanNR"/>
		END_VAR
		VAR_OUTPUT
			retval (EAX) 	: DINT;			//! <Variable Comment="If the function succeeds, it returns 0, meaning that a CAN-Interface is installed. If it fails, an error code is returned, as given below: &#10;  -1 .. invalid parameter &#10;  -2 .. BIOS-Interface is not installed &#10;  -3 .. CAN is not enabled &#10;  -4 .. CAN-Interface is not installed &#10;  -5 .. Initializing of CAN-Interface failed" Name="IsInstalled.retval"/>
		END_VAR;
				//! <Function Comment="This function returns the Station-number of an active CAN-Interface." Name="GetMyStation"/>
	FUNCTION __CDECL VIRTUAL GLOBAL GetMyStation
		VAR_INPUT
			CanNR 	: USINT;			//! <Variable Comment="Parameter CanNr specifies the number of the CAN-Interfaces to check (1=CAN1, 2=CAN2, etc.)." Name="GetMyStation.CanNR"/>
			Station 	: ^USINT;			//! <Variable Comment="Parameter Station points to a variable, which retrieves the station number (value from 0-31)." Name="GetMyStation.Station"/>
		END_VAR
		VAR_OUTPUT
			retval (EAX) 	: DINT;			//! <Variable Comment="If the function succeeds, it returns 0. If it fails, an error code is returned, as given below: &#10;  -1 .. invalid parameter &#10;  -2 .. BIOS-Interface is not installed &#10;  -3 .. CAN is not enabled &#10;  -4 .. CAN-Interface is not installed &#10;  -5 .. Initializing of CAN-Interface failed" Name="GetMyStation.retval"/>
		END_VAR;
				//! <Function Comment="This function sets the Station-number of a LOCAL CAN-Interface." Name="SetMyStation"/>
	FUNCTION __CDECL VIRTUAL GLOBAL SetMyStation
		VAR_INPUT
			CanNR 	: USINT;			//! <Variable Comment="Parameter CanNr specifies the number of the CAN-Interfaces to check (1=CAN1, 2=CAN2, etc.)." Name="SetMyStation.CanNR"/>
			Station 	: USINT;			//! <Variable Comment="Parameter Station is a variable, which sets the station number (value from 0-31)." Name="SetMyStation.Station"/>
		END_VAR
		VAR_OUTPUT
			retval (EAX) 	: DINT;			//! <Variable Comment="If the function succeeds, it returns 0. If it fails, an error code is returned, as given below: &#10;  -1 .. invalid parameter &#10;  -2 .. BIOS-Interface is not installed &#10;  -3 .. CAN is not enabled &#10;  -4 .. CAN-Interface is not installed &#10;  -5 .. Initializing of CAN-Interface failed" Name="SetMyStation.retval"/>
		END_VAR;
				//! <Function Comment="This function retrieves the Baud rate of a local CAN-Interface." Name="GetBaudrate"/>
	FUNCTION __CDECL VIRTUAL GLOBAL GetBaudrate
		VAR_INPUT
			CanNR 	: USINT;			//! <Variable Comment="Parameter CanNr specifies the num-ber of the CAN-Interfaces to check (1=CAN1, 2=CAN2, etc.)." Name="GetBaudrate.CanNR"/>
			Baudrate 	: ^USINT;			//! <Variable Comment="Parameter Baud rate points to a variable, which retrieves the station number (value from 0-7). &#10;0 = 615 kBit/s       1 = 500 kBit/s &#10;2 = 250 kBit/s       3 = 125 kBit/s &#10;4 = 100 kBit/s       5 = 50 kBit/s &#10;6 = 20 kBit/s         7 = 1 MBit/s" Name="GetBaudrate.Baudrate"/>
		END_VAR
		VAR_OUTPUT
			retval (EAX) 	: DINT;			//! <Variable Comment="If the function succeeds, it returns 0. If it fails, an error code is returned, as given below: &#10;  -1 .. invalid parameter &#10;  -2 .. BIOS-Interface is not installed &#10;  -3 .. CAN is not enabled &#10;  -4 .. CAN-Interface is not installed &#10;  -5 .. Initializing of CAN-Interface failed" Name="GetBaudrate.retval"/>
		END_VAR;
				//! <Function Comment="This function sets the Baud rate of a local CAN-Interface." Name="SetBaudrate"/>
	FUNCTION __CDECL VIRTUAL GLOBAL SetBaudrate
		VAR_INPUT
			CanNR 	: USINT;			//! <Variable Comment="Parameter CanNr specifies the number of the CAN-Interfaces to check (1=CAN1, 2=CAN2, etc.)." Name="SetBaudrate.CanNR"/>
			Baudrate 	: USINT;			//! <Variable Comment="Parameter Baud rate is a variable, which sets the station number (value from 0-7). &#10;0 = 615 kBit/s       1 = 500 kBit/s &#10;2 = 250 kBit/s       3 = 125 kBit/s &#10;4 = 100 kBit/s       5 = 50 kBit/s &#10;6 = 20 kBit/s         7 = 1 MBit/s" Name="SetBaudrate.Baudrate"/>
		END_VAR
		VAR_OUTPUT
			retval (EAX) 	: DINT;			//! <Variable Comment="If the function succeeds, it returns 0. If it fails, an error code is returned, as given below: &#10;  -1 .. invalid parameter &#10;  -2 .. BIOS-Interface is not installed &#10;  -3 .. CAN is not enabled &#10;  -4 .. CAN-Interface is not installed &#10;  -5 .. Initializing of CAN-Interface failed" Name="SetBaudrate.retval"/>
		END_VAR;
				//! <Function Comment="Send a single object at the can bus. If the bus or the stack is not free, we put this object on the bus. So it&apos;s only allowed to call this function 20 times within 250us. The CAN stack is not bigger and then you overload the can bus!" Name="CanTxObj"/>
	FUNCTION __CDECL VIRTUAL GLOBAL CanTxObj
		VAR_INPUT
			CanNr 	: USINT;			//! <Variable Comment="The CanNr parameter specifies the number of the CAN-Interface (starting with 1)." Name="CanTxObj.CanNr"/>
			ObjNr 	: INT;
			length 	: USINT;
			data 	: pVoid;
		END_VAR
		VAR_OUTPUT
			retval (AX) 	: INT;			//! <Variable Comment="Return codes: &#10;  0: OK! &#10;  1: wrong Can-interface (only 1 or 2) &#10;  2: length greater 8 or objnr greater 2047 &#10;  4: buffer full From version 01.01.049: &#10;  5: objnr invalid, used by system" Name="CanTxObj.retval"/>
		END_VAR;
				//! <Function Comment="Add a single object to the can bus. Should only be used for Rx-objects." Name="AddCanObj"/>
	FUNCTION __CDECL VIRTUAL GLOBAL AddCanObj
		VAR_INPUT
			CanNr 	: USINT;			//! <Variable Comment="The CanNr parameter specifies the number of the CAN-Interface (starting with 1)." Name="AddCanObj.CanNr"/>
			ObjNr 	: INT;			//! <Variable Comment="Object number transmitted on the CAN" Name="AddCanObj.ObjNr"/>
			length 	: USINT;			//! <Variable Comment="Object size valid from 0-8 byte" Name="AddCanObj.length"/>
			mode 	: USINT;			//! <Variable Comment="mode 0 = rx without IRQ &#10;mode 1 = rx with IRQ &#10;mode 2 = tx (function CanTxObj should be used)" Name="AddCanObj.mode"/>
			actionptr 	: pVoid;			//! <Variable Comment="Is a pointer on a function that is called on IRQ" Name="AddCanObj.actionptr"/>
			thispointer 	: pVoid;
		END_VAR
		VAR_OUTPUT
			retval (EAX) 	: DINT;			//! <Variable Comment="Return codes: &#10; &lt; 0:  error &#10;   -1:  wrong CAN interface &#10;   -2:  length &gt; 8 &#10;   -3:  objnr &gt; 2047 &#10;   -4:  mode &gt; 2 &#10;   -5:  no free User CAN-Object &#10; &gt; 0:  o.k &#10; 1..11:  nr. of the used User CAN-Object &#10;&#10; From version 01.01.049: &#10;   -6: objnr invalid, used by system" Name="AddCanObj.retval"/>
		END_VAR;
				//! <Function Comment="This method is only used by the loader. &#10;This will not change in the next time and therefore the method won&apos;t be described in more detail." Name="LoginIntoCanNew"/>
	FUNCTION __CDECL VIRTUAL GLOBAL LoginIntoCanNew
		VAR_INPUT
			CanNr 	: USINT;
			CanStation 	: USINT;
			TxObjNr 	: INT;
		END_VAR
		VAR_OUTPUT
			retval (AX) 	: UINT;
		END_VAR;
				//! <Function Comment="This function initializes the filters to listen for more than one CAN-object." Name="InitBasicCanObject"/>
	FUNCTION __CDECL VIRTUAL GLOBAL InitBasicCanObject
		VAR_INPUT
			CanNr 	: USINT;			//! <Variable Comment="Parameter CanNr must be a valid CAN-Interface Nr (1, 2)." Name="InitBasicCanObject.CanNr"/>
			ObjNr 	: INT;			//! <Variable Comment="Parameter ObjNr is the RX-object&apos;s number." Name="InitBasicCanObject.ObjNr"/>
			mask 	: INT;			//! <Variable Comment="Parameter mask is the bitmask-filter for which CAN-objects to listen." Name="InitBasicCanObject.mask"/>
			actionpointer 	: pVoid;			//! <Variable Comment="Parameter actionpointer points to the function, which is called at retrieval of an object fitting the mask." Name="InitBasicCanObject.actionpointer"/>
			thispointer 	: pVoid;			//! <Variable Comment="Parameter hispointer is the thispointer of the calling object." Name="InitBasicCanObject.thispointer"/>
		END_VAR
		VAR_OUTPUT
			retval (EAX) 	: DINT;			//! <Variable Comment="If the function succeeds, ZERO is returned, otherwise, one of the following negative error code returns: &#10;  -1 .. Wrong CAN-interface number &#10;  -3 .. Object number too great" Name="InitBasicCanObject.retval"/>
		END_VAR;
				//! <Function Comment="Delete a single user CAN-object" Name="DelCanObj"/>
	FUNCTION __CDECL VIRTUAL GLOBAL DelCanObj
		VAR_INPUT
			CanNr 	: USINT;			//! <Variable Comment="Valid 1 or in DCL also 2" Name="DelCanObj.CanNr"/>
			Handle 	: DINT;			//! <Variable Comment="User object handle returned from AddCanObj" Name="DelCanObj.Handle"/>
		END_VAR
		VAR_OUTPUT
			retval (EAX) 	: DINT;			//! <Variable Comment="Return codes: &#10;  &lt; 0:  error &#10;    -1:  invalid cannr &#10;    -2:  invalid handle &#10;  = 0:  o.k" Name="DelCanObj.retval"/>
		END_VAR;
				//! <Function Comment="Delete a basic CAN-object." Name="DelBasicCanObj"/>
	FUNCTION __CDECL VIRTUAL GLOBAL DelBasicCanObj
		VAR_INPUT
			CanNr 	: USINT;			//! <Variable Comment="Valid 1 or in DCL also 2" Name="DelBasicCanObj.CanNr"/>
		END_VAR
		VAR_OUTPUT
			retval (EAX) 	: DINT;			//! <Variable Comment="Return codes: &#10;  &lt; 0:  error &#10;    -1:  invalid cannr &#10;  = 0:  o.k" Name="DelBasicCanObj.retval"/>
		END_VAR;
				//! <Function Comment="This function sends a remote frame on a configured CAN-object.&#10;&#10;Requirements: &#10;  LasalOS &gt;= 01.01.128 &#10;  Class _CAN &gt;= 0.3" Name="TxRmtFrame"/>
	FUNCTION __CDECL VIRTUAL GLOBAL TxRmtFrame
		VAR_INPUT
			CanNr 	: USINT;			//! <Variable Comment="Valid 1 or in DCL also 2" Name="TxRmtFrame.CanNr"/>
			Handle 	: DINT;			//! <Variable Comment="User object handle returned from AddCanObj" Name="TxRmtFrame.Handle"/>
		END_VAR
		VAR_OUTPUT
			retval (EAX) 	: DINT;			//! <Variable Comment="Return codes: &#10;  &lt; 0:  error &#10;    -1:  invalid cannr &#10;    -2:  invalid handle &#10;    -3: &#10;  = 0:  o.k" Name="TxRmtFrame.retval"/>
		END_VAR;
				//! <Function Comment="Clears the transmit buffer.&#13;&#10;Works only with ARM cpu&apos;s" Name="ClearMsgQueue"/>
	FUNCTION __CDECL VIRTUAL GLOBAL ClearMsgQueue
		VAR_INPUT
			CanNr 	: USINT;			//! <Variable Comment="Valid 1 or in DCL also 2" Name="ClearMsgQueue.CanNr"/>
		END_VAR
		VAR_OUTPUT
			retval (EAX) 	: DINT;			//! <Variable Comment="Return codes: 0 = o.k, -1 Error" Name="ClearMsgQueue.retval"/>
		END_VAR;
				//! <Function Comment="Get the state of a local can controller. (ARM only)" Name="GetControllerState"/>
	FUNCTION __CDECL VIRTUAL GLOBAL GetControllerState
		VAR_INPUT
			CanNr 	: USINT;			//! <Variable Comment="Valid 1 or in DCL also 2" Name="GetControllerState.CanNr"/>
		END_VAR
		VAR_OUTPUT
			retval (EAX) 	: DINT;			//! <Variable Comment="Return codes: -1 Error&#13;&#10;               0 CAN_STATE_ACTIVE&#13;&#10;               1 CAN_STATE_ERROR_WARNING&#13;&#10;               2 CAN_STATE_ERROR_PASSIVE&#13;&#10;               3 CAN_STATE_BUS_OFF&#13;&#10;               4 CAN_STATE_SCANNING_BAUDRATE&#13;&#10;               5 CAN_STATE_STOPPED&#13;&#10;               6 CAN_STATE_SLEEPING&#13;&#10;" Name="GetControllerState.retval"/>
		END_VAR;
				//! <Function Comment="Restart the can controller (ARM only)" Name="Restart"/>
	FUNCTION __CDECL VIRTUAL GLOBAL Restart
		VAR_INPUT
			CanNr 	: USINT;			//! <Variable Comment="Valid 1 or in DCL also 2" Name="Restart.CanNr"/>
		END_VAR
		VAR_OUTPUT
			retval (EAX) 	: DINT;			//! <Variable Comment="Return codes: 0 = o.k, -1 Error" Name="Restart.retval"/>
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

//}}LSL_DECLARATION


FUNCTION GLOBAL TAB _Can::@CT_
0$UINT,
2#0100000000001000$UINT, //TY__CAN
0$UINT, 4$UINT, (SIZEOF(::_Can))$UINT, 
1$UINT, 0$UINT, 0$UINT, 
TO_UDINT(3102794146), "_Can", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::_Can.Server0.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(2759080719), "Server0", 
//Clients:
END_FUNCTION


#define USER_CNT__Can 15

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT__Can] OF ^Void;
	END_STRUCT;
END_TYPE



//{{LSL_IMPLEMENTATION


//*********************Inserted from <.\OS Interface\code\_Can_00_00.st>*********************



 




#include <Rtos_interfaces.h> // we need this for the SysCIL functions
#include "..\..\Source\code\OsiBaseNew.h"

#define CANERROR_FCNNOTAVAILABLE    -99   // Function is not available

#pragma warning(disable:73)
FUNCTION __CDECL ErrFcn_DelCanObj
VAR_INPUT
    CanNR       : USINT;
    Handle      : DINT;
END_VAR
VAR_OUTPUT
    retval      : DINT;
END_VAR
	retval := CANERROR_FCNNOTAVAILABLE;
END_FUNCTION

FUNCTION __CDECL GLOBAL ErrFcn_DelBasicCanObj
VAR_INPUT
    CanNR       : USINT;
END_VAR
VAR_OUTPUT
    retval      : DINT;
END_VAR
	retval := CANERROR_FCNNOTAVAILABLE;
END_FUNCTION
FUNCTION __CDECL ErrFcn
VAR_OUTPUT
    retval      : DINT;
END_VAR
	retval := CANERROR_FCNNOTAVAILABLE;
END_FUNCTION
#pragma warning(default:73)


FUNCTION  _Can::_Can
VAR_OUTPUT
	ret_code		: CONFSTATES;
END_VAR
VAR
    pCan    : ^OS_CAN;
	pSSR    : ^OS_SSR;
	aMeths	: ARRAY[0.. USER_CNT__Can] OF ^void;
	retv    : SYS_ERROR;
END_VAR;

	retv := OS_CILGet("CANUSER", #pCan$void);

	if retv <> SYS_ERR_NONE then

		TRACE("ERROR: CAN-USER Interface not available with this version/platform!");
		ret_code	:= C_UNKNOWN_CONSTR;
    else
		
		retv := OS_CILGet("SSR", #pSSR$void);
		if retv <> SYS_ERR_NONE then

			TRACE("ERROR: KERNEL Interface not available with this version/platform!");
			ret_code	:= C_UNKNOWN_CONSTR;

		else
		    aMeths [0]  := pCan^.ISINSTALLED;
		    aMeths [1]  := pCan^.GETMYSTATION;
		    aMeths [2]  := pCan^.SETMYSTATION;
		    aMeths [3]  := pCan^.GETMYBAUDRATE;
		    aMeths [4]  := pCan^.SETMYBAUDRATE;

			aMeths [5]  := pSSR^.CanTxObj;
			aMeths [6]  := pSSR^.AddCanObj;
			aMeths [7]  := pSSR^.LoginIntoCANNew;
			aMeths [8]  := pSSR^.InitBasicCanObject;

			IF pCan^.udVersion >= 4 THEN
			    aMeths [9]  := pCan^.DelCanObj;
			    aMeths [10] := pCan^.DelBasicCanObj;
				IF pCan^.udVersion >= 6 THEN
				    aMeths [11] := pCan^.TxRmtFrame;
				ELSE
				    aMeths [11] := #ErrFcn();
				END_IF;
				IF pCan^.udVersion >= 8 THEN
				    aMeths [12] := pCan^.ClearMsgQueue;
				ELSE
				    aMeths [12] := #ErrFcn();
				END_IF;
				IF pCan^.udVersion >= 9 THEN
				    aMeths [13] := pCan^.GetControllerState;
				    aMeths [14] := pCan^.Restart;
				ELSE
				    aMeths [13] := #ErrFcn();
				    aMeths [14] := #ErrFcn();
				END_IF;
			ELSE
			    aMeths [9]  := #ErrFcn_DelCanObj();
			    aMeths [10] := #ErrFcn_DelBasicCanObj();
			    aMeths [11] := #ErrFcn();
			    aMeths [12] := #ErrFcn();
			    aMeths [13] := #ErrFcn();
			    aMeths [14] := #ErrFcn();
			END_IF;

			ret_code	:= InitOsiM_new(#aMeths[0]$void, USER_CNT__Can);
		end_if;
	end_if;

END_FUNCTION //  _Can::_Can
