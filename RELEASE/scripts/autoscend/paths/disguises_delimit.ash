void majora_initializeSettings()
{
	if(auto_my_path() == "Disguises Delimit")
	{
		set_property("auto_getBeehive", true);
		set_property("auto_getBoningKnife", true);
	}
}

boolean LM_majora()
{
	if(auto_my_path() == "Disguises Delimit")
	{
	}
	return false;
}

