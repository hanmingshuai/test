#include <stdio.h>
#include <lua.h>
#include <lauxlib.h>
static void stackDump(lua_State *L)
{
    int i;
    int top = lua_gettop(L);
    for (i = 1; i <= top; i++)
    {
        int t = lua_type(L, i);
        switch (t)
        {
        case LUA_TSTRING:
        {
            printf("'%s'", lua_tostring(L, i));
            break;
        }
        case LUA_TBOOLEAN:
        {
            printf(lua_toboolean(L, i) ? "true" : "false");
            break;
        }
        case LUA_TNUMBER:
        {
            if (lua_isinteger(L, i))
                printf("%lld", lua_tointeger(L, i));
            else
                printf("%g", lua_tonumber(L, i));
            break;
        }
        default:
        {
            printf("%s", lua_typename(L, t));
            break;
        }
        }
        printf(" ");
    }
    printf("\n");
}
int main(void)
{
    lua_State *L = luaL_newstate();
    lua_pushnumber(L, 3.5);
    stackDump(L);
    lua_pushstring(L, "hello");
    stackDump(L);
    lua_pushnil(L);
    stackDump(L);
    lua_rotate(L, 1, -1);
    stackDump(L);
    lua_pushvalue(L, -2);
    stackDump(L);
    lua_remove(L, 1);
    stackDump(L);
    lua_insert(L, -2);
    stackDump(L);
    lua_close(L);
    return 0;
}
