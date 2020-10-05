import <relay_autoscend.ash>

void main()
{
	write_styles();
	writeln("<html><head><title>autoscend extra settings</title>");
	writeln("</head><body><h1>autoscend extra settings</h1>");

	file_to_map("autoscend_settings_extra.txt", s);

	boolean dickstab = false;
	
	writeln("<br><a href=\"relay_autoscend.php\">Return to main autoscend page</a><br>");

	fields = form_fields();
	if(count(fields) > 0)
	{
		foreach x in fields
		{
			if(contains_text(x, "_didchange"))
			{
				continue;
			}

			string oldSetting = form_field(x + "_didchange");
			if(oldSetting == fields[x])
			{
				if(get_property(x) != fields[x])
				{
					writeln("You did not change setting " + x + ". It changed since you last loaded the page, ignoring.<br>");
				}
				continue;
			}
#			else
#			{
#				writeln("Property " + x + " had: " + oldSetting + " now: " + fields[x] + "<br>");
#			}

			if(x == "auto_dickstab")
			{
				if((fields[x] != get_property("auto_dickstab")) && (fields[x] == "true"))
				{
					dickstab = true;
				}
			}
			if(get_property(x) != fields[x])
			{
				writeln("Changing setting " + x + " to " + fields[x] + "<br>");
				set_property(x, fields[x]);
			}
		}
	}

	writeln("<form action='' method='post'>");
	writeln("<table><tr><th width=20%>Setting</th><th width=20%>Value</th><th width=60%>Description</th></tr>");
	foreach x in s["any"]
	{
		handleSetting("any", x);
	}
	foreach x in s["pre"]
	{
		handleSetting("pre", x);
	}
	foreach x in s["post"]
	{
		handleSetting("post", x);
	}
	foreach x in s["action"]
	{
		handleSetting("action", x);
	}
	foreach x in s["sharing"]
	{
		if(get_property("auto_allowSharingData").to_boolean())
		{
			handleSetting("sharing", x);
		}
	}
	writeln("<tr><td align=center colspan='3'><input type='submit' name='' value='Save Changes'/></td></tr></table></form>");
	
	write_settings_key();		//display the key to the settings table
	
	writeln("</body></html>");
}