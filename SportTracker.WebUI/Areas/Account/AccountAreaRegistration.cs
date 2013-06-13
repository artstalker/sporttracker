﻿using System.Web.Mvc;

namespace SportTracker.WebUI.Areas.Account
{
	public class AccountAreaRegistration : AreaRegistration
	{
		public override string AreaName
		{
			get
			{
				return "Account";
			}
		}

		public override void RegisterArea(AreaRegistrationContext context)
		{
			context.MapRoute(
				 "Area_Account_default",
				 "Account/{controller}/{action}/{id}",
				 new { action = "Index", id = UrlParameter.Optional }
			);
		}
	}
}
