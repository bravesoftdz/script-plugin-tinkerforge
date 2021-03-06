{
  This file was automatically generated on 2016-01-06.

  Delphi/Lazarus Bindings Version 2.1.9

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletRemoteSwitch;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_REMOTE_SWITCH_DEVICE_IDENTIFIER = 235;
  BRICKLET_REMOTE_SWITCH_DEVICE_DISPLAY_NAME = 'Remote Switch Bricklet';

  BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET = 1;
  BRICKLET_REMOTE_SWITCH_FUNCTION_GET_SWITCHING_STATE = 2;
  BRICKLET_REMOTE_SWITCH_FUNCTION_SET_REPEATS = 4;
  BRICKLET_REMOTE_SWITCH_FUNCTION_GET_REPEATS = 5;
  BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET_A = 6;
  BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET_B = 7;
  BRICKLET_REMOTE_SWITCH_FUNCTION_DIM_SOCKET_B = 8;
  BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET_C = 9;
  BRICKLET_REMOTE_SWITCH_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_REMOTE_SWITCH_CALLBACK_SWITCHING_DONE = 3;

  BRICKLET_REMOTE_SWITCH_SWITCH_TO_OFF = 0;
  BRICKLET_REMOTE_SWITCH_SWITCH_TO_ON = 1;
  BRICKLET_REMOTE_SWITCH_SWITCHING_STATE_READY = 0;
  BRICKLET_REMOTE_SWITCH_SWITCHING_STATE_BUSY = 1;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletRemoteSwitch = class;
  TBrickletRemoteSwitchNotifySwitchingDone = procedure(sender: TBrickletRemoteSwitch) of object;

  /// <summary>
  ///  Controls remote mains switches
  /// </summary>
  TBrickletRemoteSwitch = class(TDevice)
  private
    switchingDoneCallback: TBrickletRemoteSwitchNotifySwitchingDone;
  protected
    procedure CallbackWrapperSwitchingDone(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  This function is deprecated, use <see cref="BrickletRemoteSwitch.TBrickletRemoteSwitch.SwitchSocketA"/> instead.
    /// </summary>
    procedure SwitchSocket(const houseCode: byte; const receiverCode: byte; const switchTo: byte); virtual;

    /// <summary>
    ///  Returns the current switching state. If the current state is busy, the
    ///  Bricklet is currently sending a code to switch a socket. It will not
    ///  accept any calls of <see cref="BrickletRemoteSwitch.TBrickletRemoteSwitch.SwitchSocket"/> until the state changes to ready.
    ///  
    ///  How long the switching takes is dependent on the number of repeats, see
    ///  <see cref="BrickletRemoteSwitch.TBrickletRemoteSwitch.SetRepeats"/>.
    /// </summary>
    function GetSwitchingState: byte; virtual;

    /// <summary>
    ///  Sets the number of times the code is send when of the <see cref="BrickletRemoteSwitch.TBrickletRemoteSwitch.SwitchSocket"/>
    ///  functions is called. The repeats basically correspond to the amount of time
    ///  that a button of the remote is pressed.
    ///  
    ///  Some dimmers are controlled by the length of a button pressed,
    ///  this can be simulated by increasing the repeats.
    ///  
    ///  The default value is 5.
    /// </summary>
    procedure SetRepeats(const repeats: byte); virtual;

    /// <summary>
    ///  Returns the number of repeats as set by <see cref="BrickletRemoteSwitch.TBrickletRemoteSwitch.SetRepeats"/>.
    /// </summary>
    function GetRepeats: byte; virtual;

    /// <summary>
    ///  To switch a type A socket you have to give the house code, receiver code and the
    ///  state (on or off) you want to switch to.
    ///  
    ///  The house code and receiver code have a range of 0 to 31 (5bit).
    ///  
    ///  A detailed description on how you can figure out the house and receiver code
    ///  can be found :ref:`here &lt;remote_switch_bricklet_type_a_house_and_receiver_code&gt;`.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure SwitchSocketA(const houseCode: byte; const receiverCode: byte; const switchTo: byte); virtual;

    /// <summary>
    ///  To switch a type B socket you have to give the address, unit and the state
    ///  (on or off) you want to switch to.
    ///  
    ///  The address has a range of 0 to 67108863 (26bit) and the unit has a range
    ///  of 0 to 15 (4bit). To switch all devices with the same address use 255 for
    ///  the unit.
    ///  
    ///  A detailed description on how you can teach a socket the address and unit can
    ///  be found :ref:`here &lt;remote_switch_bricklet_type_b_address_and_unit&gt;`.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure SwitchSocketB(const address: longword; const unit2: byte; const switchTo: byte); virtual;

    /// <summary>
    ///  To control a type B dimmer you have to give the address, unit and the
    ///  dim value you want to set the dimmer to.
    ///  
    ///  The address has a range of 0 to 67108863 (26bit), the unit and the dim value
    ///  has a range of 0 to 15 (4bit).
    ///  
    ///  A detailed description on how you can teach a dimmer the address and unit can
    ///  be found :ref:`here &lt;remote_switch_bricklet_type_b_address_and_unit&gt;`.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure DimSocketB(const address: longword; const unit2: byte; const dimValue: byte); virtual;

    /// <summary>
    ///  To switch a type C socket you have to give the system code, device code and the
    ///  state (on or off) you want to switch to.
    ///  
    ///  The system code has a range of 'A' to 'P' (4bit) and the device code has a
    ///  range of 1 to 16 (4bit).
    ///  
    ///  A detailed description on how you can figure out the system and device code
    ///  can be found :ref:`here &lt;remote_switch_bricklet_type_c_system_and_device_code&gt;`.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure SwitchSocketC(const systemCode: char; const deviceCode: byte; const switchTo: byte); virtual;

    /// <summary>
    ///  Returns the UID, the UID where the Bricklet is connected to, 
    ///  the position, the hardware and firmware version as well as the
    ///  device identifier.
    ///  
    ///  The position can be 'a', 'b', 'c' or 'd'.
    ///  
    ///  The device identifier numbers can be found :ref:`here &lt;device_identifier&gt;`.
    ///  |device_identifier_constant|
    /// </summary>
    procedure GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word); override;

    /// <summary>
    ///  This callback is called whenever the switching state changes
    ///  from busy to ready, see <see cref="BrickletRemoteSwitch.TBrickletRemoteSwitch.GetSwitchingState"/>.
    /// </summary>
    property OnSwitchingDone: TBrickletRemoteSwitchNotifySwitchingDone read switchingDoneCallback write switchingDoneCallback;
  end;

implementation

constructor TBrickletRemoteSwitch.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 1;

  responseExpected[BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_REMOTE_SWITCH_FUNCTION_GET_SWITCHING_STATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_REMOTE_SWITCH_CALLBACK_SWITCHING_DONE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_REMOTE_SWITCH_FUNCTION_SET_REPEATS] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_REMOTE_SWITCH_FUNCTION_GET_REPEATS] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET_A] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET_B] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_REMOTE_SWITCH_FUNCTION_DIM_SOCKET_B] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET_C] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_REMOTE_SWITCH_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_REMOTE_SWITCH_CALLBACK_SWITCHING_DONE] := {$ifdef FPC}@{$endif}CallbackWrapperSwitchingDone;
end;

procedure TBrickletRemoteSwitch.SwitchSocket(const houseCode: byte; const receiverCode: byte; const switchTo: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET, 11);
  LEConvertUInt8To(houseCode, 8, request);
  LEConvertUInt8To(receiverCode, 9, request);
  LEConvertUInt8To(switchTo, 10, request);
  SendRequest(request);
end;

function TBrickletRemoteSwitch.GetSwitchingState: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_FUNCTION_GET_SWITCHING_STATE, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletRemoteSwitch.SetRepeats(const repeats: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_FUNCTION_SET_REPEATS, 9);
  LEConvertUInt8To(repeats, 8, request);
  SendRequest(request);
end;

function TBrickletRemoteSwitch.GetRepeats: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_FUNCTION_GET_REPEATS, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletRemoteSwitch.SwitchSocketA(const houseCode: byte; const receiverCode: byte; const switchTo: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET_A, 11);
  LEConvertUInt8To(houseCode, 8, request);
  LEConvertUInt8To(receiverCode, 9, request);
  LEConvertUInt8To(switchTo, 10, request);
  SendRequest(request);
end;

procedure TBrickletRemoteSwitch.SwitchSocketB(const address: longword; const unit2: byte; const switchTo: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET_B, 14);
  LEConvertUInt32To(address, 8, request);
  LEConvertUInt8To(unit2, 12, request);
  LEConvertUInt8To(switchTo, 13, request);
  SendRequest(request);
end;

procedure TBrickletRemoteSwitch.DimSocketB(const address: longword; const unit2: byte; const dimValue: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_FUNCTION_DIM_SOCKET_B, 14);
  LEConvertUInt32To(address, 8, request);
  LEConvertUInt8To(unit2, 12, request);
  LEConvertUInt8To(dimValue, 13, request);
  SendRequest(request);
end;

procedure TBrickletRemoteSwitch.SwitchSocketC(const systemCode: char; const deviceCode: byte; const switchTo: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET_C, 11);
  LEConvertCharTo(systemCode, 8, request);
  LEConvertUInt8To(deviceCode, 9, request);
  LEConvertUInt8To(switchTo, 10, request);
  SendRequest(request);
end;

procedure TBrickletRemoteSwitch.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletRemoteSwitch.CallbackWrapperSwitchingDone(const packet: TByteArray);

begin
  Assert(packet <> nil); { Avoid 'Parameter not used' warning }
  if (Assigned(switchingDoneCallback)) then begin
    switchingDoneCallback(self);
  end;
end;

end.
