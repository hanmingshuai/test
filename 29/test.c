//29.1
static int summation(lua_State *L)
{
	int parnum;
	double sum=0.0;
	parnum=lua_gettop(L);
	for(int i=1;i<=parnum;i++)
	{
		sum+=luaL_checknumber(L,i);
	}
	lua_pushnumber(L,sum);
	return 1;
}
//29.2
static int pack(lua_State *L)
{
	int parnum=lua_gettop(L);
	lua_newtable(L);
	for(int index=1;index<=parnum;index++)
	{
		lua_pushinteger(L,index);
		lua_rotate(L,1,-1);
		lua_settable(L,-3);
	}
	return 1;
}
//29.3
static int reverse(lua_State *L)
{
	int parnum=lua_gettop(L);
	for(int index=1;index<=parnum/2;index++)
	{
		lua_pushvalue(L,index);
		lua_pushvalue(L,parnum-index+1);
		lua_replace(L,index);
		lua_replace(L,parnum-index+1);
	}
	return parnum;
}
//29.4
static int foreach(lua_State *L)
{
	lua_pushnil(L);
	while(lua_next(L,1)!=0)
	{
		lua_pushvalue(L,2);
		lua_pushvalue(L,3);
		lua_rotate(L,2,2);
		lua_pcall(L,2,0,0);	//两总实现都可以
	}
	return 0;
}