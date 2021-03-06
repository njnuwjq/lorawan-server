%
% Copyright (c) 2016 Petr Gotthard <petr.gotthard@centrum.cz>
% All rights reserved.
% Distributed under the terms of the MIT License. See the LICENSE file.
%
% The 'Sensors GPS Demo' application from the LoRa Demo Kit
% https://github.com/Lora-net/LoRaMac-node
%
-module(lorawan_application_mote).

-export([init/1, handle/5]).

init(_App) ->
    ok.

% the data structure is explained in
% https://github.com/Lora-net/LoRaMac-node/blob/master/src/apps/LoRaMac/classA/LoRaMote/main.c#L207
handle(DevAddr, _App, _AppID, 2, <<LED, Press:16, Temp:16, _AltBar:16, Batt, _Lat:24, _Lon:24, _AltGps:16>>) ->
    lager:debug("PUSH_DATA ~w ~w ~w ~w",[DevAddr, Press, Temp, Batt]),
    {send, 2, <<((LED+1) rem 2)>>}.

% end of file
