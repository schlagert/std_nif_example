%%%=============================================================================
%%% @doc
%%% Simple erlang NIF example taken from
%%% http://www.erlang.org/doc/man/erl_nif.html.
%%% @end
%%%=============================================================================

-module(niftest).

-export([hello/0]).

-on_load(init/0).

%%------------------------------------------------------------------------------
%% @doc
%% Returns a specific string.
%% @end
%%------------------------------------------------------------------------------
hello() ->
    "NIF library not loaded".

%%------------------------------------------------------------------------------
%% @private
%%------------------------------------------------------------------------------
init() ->
    case erlang:load_nif("./niftest", 0) of
        ok ->
            io:format("NIF library successfully loaded~n");

        {error, {Reason, Text}} ->
            io:format("NIF library failed to load ~p (~p)~n", [Reason, Text])
    end.
