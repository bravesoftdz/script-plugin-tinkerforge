{
  This file was automatically generated on 2016-01-06.

  Delphi/Lazarus Bindings Version 2.1.9

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletIndustrialQuadRelay;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_INDUSTRIAL_QUAD_RELAY_DEVICE_IDENTIFIER = 225;
  BRICKLET_INDUSTRIAL_QUAD_RELAY_DEVICE_DISPLAY_NAME = 'Industrial Quad Relay Bricklet';

  BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_VALUE = 1;
  BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_VALUE = 2;
  BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_MONOFLOP = 3;
  BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_MONOFLOP = 4;
  BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_GROUP = 5;
  BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_GROUP = 6;
  BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_AVAILABLE_FOR_GROUP = 7;
  BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_SELECTED_VALUES = 9;
  BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_INDUSTRIAL_QUAD_RELAY_CALLBACK_MONOFLOP_DONE = 8;


type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To3OfChar = array [0..3] of char;

  TBrickletIndustrialQuadRelay = class;
  TBrickletIndustrialQuadRelayNotifyMonoflopDone = procedure(sender: TBrickletIndustrialQuadRelay; const selectionMask: word; const valueMask: word) of object;

  /// <summary>
  ///  4 galvanically isolated solid state relays
  /// </summary>
  TBrickletIndustrialQuadRelay = class(TDevice)
  private
    monoflopDoneCallback: TBrickletIndustrialQuadRelayNotifyMonoflopDone;
  protected
    procedure CallbackWrapperMonoflopDone(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Sets the output value with a bitmask (16bit). A 1 in the bitmask means relay
    ///  closed and a 0 means relay open.
    ///  
    ///  For example: The value 3 or 0b0011 will close the relay of pins 0-1 and open
    ///  the other pins.
    ///  
    ///  If no groups are used (see <see cref="BrickletIndustrialQuadRelay.TBrickletIndustrialQuadRelay.SetGroup"/>), the pins correspond to the
    ///  markings on the Quad Relay Bricklet.
    ///  
    ///  If groups are used, the pins correspond to the element in the group.
    ///  Element 1 in the group will get pins 0-3, element 2 pins 4-7, element 3
    ///  pins 8-11 and element 4 pins 12-15.
    /// </summary>
    procedure SetValue(const valueMask: word); virtual;

    /// <summary>
    ///  Returns the bitmask as set by <see cref="BrickletIndustrialQuadRelay.TBrickletIndustrialQuadRelay.SetValue"/>.
    /// </summary>
    function GetValue: word; virtual;

    /// <summary>
    ///  Configures a monoflop of the pins specified by the first parameter
    ///  bitmask.
    ///  
    ///  The second parameter is a bitmask with the desired value of the specified
    ///  pins. A 1 in the bitmask means relay closed and a 0 means relay open.
    ///  
    ///  The third parameter indicates the time (in ms) that the pins should hold
    ///  the value.
    ///  
    ///  If this function is called with the parameters (9, 1, 1500) or
    ///  (0b1001, 0b0001, 1500): Pin 0 will close and pin 3 will open. In 1.5s pin 0
    ///  will open and pin 3 will close again.
    ///  
    ///  A monoflop can be used as a fail-safe mechanism. For example: Lets assume you
    ///  have a RS485 bus and a Quad Relay Bricklet connected to one of the slave
    ///  stacks. You can now call this function every second, with a time parameter
    ///  of two seconds and pin 0 closed. Pin 0 will be closed all the time. If now
    ///  the RS485 connection is lost, then pin 0 will be opened in at most two seconds.
    /// </summary>
    procedure SetMonoflop(const selectionMask: word; const valueMask: word; const time: longword); virtual;

    /// <summary>
    ///  Returns (for the given pin) the current value and the time as set by
    ///  <see cref="BrickletIndustrialQuadRelay.TBrickletIndustrialQuadRelay.SetMonoflop"/> as well as the remaining time until the value flips.
    ///  
    ///  If the timer is not running currently, the remaining time will be returned
    ///  as 0.
    /// </summary>
    procedure GetMonoflop(const pin: byte; out value: word; out time: longword; out timeRemaining: longword); virtual;

    /// <summary>
    ///  Sets a group of Quad Relay Bricklets that should work together. You can
    ///  find Bricklets that can be grouped together with <see cref="BrickletIndustrialQuadRelay.TBrickletIndustrialQuadRelay.GetAvailableForGroup"/>.
    ///  
    ///  The group consists of 4 elements. Element 1 in the group will get pins 0-3,
    ///  element 2 pins 4-7, element 3 pins 8-11 and element 4 pins 12-15.
    ///  
    ///  Each element can either be one of the ports ('a' to 'd') or 'n' if it should
    ///  not be used.
    ///  
    ///  For example: If you have two Quad Relay Bricklets connected to port A and
    ///  port B respectively, you could call with ``['a', 'b', 'n', 'n']``.
    ///  
    ///  Now the pins on the Quad Relay on port A are assigned to 0-3 and the
    ///  pins on the Quad Relay on port B are assigned to 4-7. It is now possible
    ///  to call <see cref="BrickletIndustrialQuadRelay.TBrickletIndustrialQuadRelay.SetValue"/> and control two Bricklets at the same time.
    /// </summary>
    procedure SetGroup(const group: TArray0To3OfChar); virtual;

    /// <summary>
    ///  Returns the group as set by <see cref="BrickletIndustrialQuadRelay.TBrickletIndustrialQuadRelay.SetGroup"/>
    /// </summary>
    function GetGroup: TArray0To3OfChar; virtual;

    /// <summary>
    ///  Returns a bitmask of ports that are available for grouping. For example the
    ///  value 5 or 0b0101 means: Port A and port C are connected to Bricklets that
    ///  can be grouped together.
    /// </summary>
    function GetAvailableForGroup: byte; virtual;

    /// <summary>
    ///  Sets the output value with a bitmask, according to the selection mask. 
    ///  The bitmask is 16 bit long, *true* refers to a closed relay and 
    ///  *false* refers to an open relay.
    ///  
    ///  For example: The values (3, 1) or (0b0011, 0b0001) will close the relay of
    ///  pin 0, open the relay of pin 1 and leave the others untouched.
    ///  
    ///  If no groups are used (see <see cref="BrickletIndustrialQuadRelay.TBrickletIndustrialQuadRelay.SetGroup"/>), the pins correspond to the
    ///  markings on the Quad Relay Bricklet.
    ///  
    ///  If groups are used, the pins correspond to the element in the group.
    ///  Element 1 in the group will get pins 0-3, element 2 pins 4-7, element 3
    ///  pins 8-11 and element 4 pins 12-15.
    /// </summary>
    procedure SetSelectedValues(const selectionMask: word; const valueMask: word); virtual;

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
    ///  This callback is triggered whenever a monoflop timer reaches 0. The
    ///  parameters contain the involved pins and the current value of the pins
    ///  (the value after the monoflop).
    /// </summary>
    property OnMonoflopDone: TBrickletIndustrialQuadRelayNotifyMonoflopDone read monoflopDoneCallback write monoflopDoneCallback;
  end;

implementation

constructor TBrickletIndustrialQuadRelay.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_VALUE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_MONOFLOP] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_MONOFLOP] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_GROUP] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_GROUP] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_AVAILABLE_FOR_GROUP] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_CALLBACK_MONOFLOP_DONE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_SELECTED_VALUES] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_INDUSTRIAL_QUAD_RELAY_CALLBACK_MONOFLOP_DONE] := {$ifdef FPC}@{$endif}CallbackWrapperMonoflopDone;
end;

procedure TBrickletIndustrialQuadRelay.SetValue(const valueMask: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_VALUE, 10);
  LEConvertUInt16To(valueMask, 8, request);
  SendRequest(request);
end;

function TBrickletIndustrialQuadRelay.GetValue: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_VALUE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletIndustrialQuadRelay.SetMonoflop(const selectionMask: word; const valueMask: word; const time: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_MONOFLOP, 16);
  LEConvertUInt16To(selectionMask, 8, request);
  LEConvertUInt16To(valueMask, 10, request);
  LEConvertUInt32To(time, 12, request);
  SendRequest(request);
end;

procedure TBrickletIndustrialQuadRelay.GetMonoflop(const pin: byte; out value: word; out time: longword; out timeRemaining: longword);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_MONOFLOP, 9);
  LEConvertUInt8To(pin, 8, request);
  response := SendRequest(request);
  value := LEConvertUInt16From(8, response);
  time := LEConvertUInt32From(10, response);
  timeRemaining := LEConvertUInt32From(14, response);
end;

procedure TBrickletIndustrialQuadRelay.SetGroup(const group: TArray0To3OfChar);
var request: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_GROUP, 12);
  for i := 0 to Length(group) - 1 do LEConvertCharTo(group[i], 8 + (i * 1), request);
  SendRequest(request);
end;

function TBrickletIndustrialQuadRelay.GetGroup: TArray0To3OfChar;
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_GROUP, 8);
  response := SendRequest(request);
  for i := 0 to 3 do result[i] := LEConvertCharFrom(8 + (i * 1), response);
end;

function TBrickletIndustrialQuadRelay.GetAvailableForGroup: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_AVAILABLE_FOR_GROUP, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletIndustrialQuadRelay.SetSelectedValues(const selectionMask: word; const valueMask: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_SELECTED_VALUES, 12);
  LEConvertUInt16To(selectionMask, 8, request);
  LEConvertUInt16To(valueMask, 10, request);
  SendRequest(request);
end;

procedure TBrickletIndustrialQuadRelay.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletIndustrialQuadRelay.CallbackWrapperMonoflopDone(const packet: TByteArray);
var selectionMask: word; valueMask: word;
begin
  if (Assigned(monoflopDoneCallback)) then begin
    selectionMask := LEConvertUInt16From(8, packet);
    valueMask := LEConvertUInt16From(10, packet);
    monoflopDoneCallback(self, selectionMask, valueMask);
  end;
end;

end.
