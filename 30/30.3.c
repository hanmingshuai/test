#include <string.h>
#include <lauxlib.h>
#include <stdio.h>
#include <lua.h>
#include <lualib.h>
static int l_transliterate(lua_State *L)
{
    int index;
    size_t len;
    luaL_Buffer b;
    luaL_checktype(L, 1, LUA_TSTRING);
    luaL_checktype(L, 2, LUA_TTABLE);
    const char *str = lua_tolstring(L, 1, &len);
    luaL_buffinit(L, &b);
    for (index = 0; index < len; index++)
    {
        lua_pushlstring(L, str + index, 1);
        switch (lua_gettable(L, 2))
        {
        case 1:
            if (lua_toboolean(L, -1))
            {
                lua_pop(L, 1);
                lua_pushlstring(L, str + index, 1);
                luaL_addvalue(&b);
                break;
            }
            else
            {
                lua_pop(L, 1);
                break;
            }
        case 4:
            luaL_addvalue(&b);
            break;
        default:
            lua_pop(L, 1);
            lua_pushlstring(L, str + index, 1);
            luaL_addvalue(&b);
        }
    }
    luaL_pushresult(&b);
    return 1;
}
