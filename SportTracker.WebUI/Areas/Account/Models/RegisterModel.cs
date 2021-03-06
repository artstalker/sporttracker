﻿using System.ComponentModel.DataAnnotations;

using SportTracker.WebUI.Code;

namespace SportTracker.WebUI.Areas.Account.Models
{
	public class RegisterModel
	{
		[Required]
		[Display(Name = "Email")]
		[ValidEmailAddress(ErrorMessage = "Incorrect e-mail.")]
		[DataType(DataType.EmailAddress)]
		public string Email { get; set; }

		[Required]
		[StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
		[DataType(DataType.Password)]
		[Display(Name = "Password")]
		public string Password { get; set; }

		[DataType(DataType.Password)]
		[Display(Name = "Confirm password")]
		[Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
		public string ConfirmPassword { get; set; }
	}
}