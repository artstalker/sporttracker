﻿#region using
using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Web.Security;
using SportTracker.Domain.Abstract;
using SportTracker.Domain.Entities;
using WebMatrix.WebData;
using User = SportTracker.Domain.Entities.User;

#endregion

namespace SportTracker.WebUI.Membership
{
   public class CustomMembershipProvider : ExtendedMembershipProvider
   {
      private readonly IUserRepository usersService;

      public CustomMembershipProvider()
      {
         usersService = DependencyResolver.Current.GetService<IUserRepository>();
      }

      #region MembershipProvider
      public override string ApplicationName
      {
         get { throw new NotImplementedException(); }
         set { throw new NotImplementedException(); }
      }

      public override bool EnablePasswordReset
      {
         get { throw new NotImplementedException(); }
      }

      public override bool EnablePasswordRetrieval
      {
         get { throw new NotImplementedException(); }
      }

      public override int MaxInvalidPasswordAttempts
      {
         get { throw new NotImplementedException(); }
      }

      public override int MinRequiredNonAlphanumericCharacters
      {
         get { throw new NotImplementedException(); }
      }

      public override int MinRequiredPasswordLength
      {
         get { throw new NotImplementedException(); }
      }

      public override int PasswordAttemptWindow
      {
         get { throw new NotImplementedException(); }
      }

      public override System.Web.Security.MembershipPasswordFormat PasswordFormat
      {
         get { throw new NotImplementedException(); }
      }

      public override string PasswordStrengthRegularExpression
      {
         get { throw new NotImplementedException(); }
      }

      public override bool RequiresQuestionAndAnswer
      {
         get { throw new NotImplementedException(); }
      }

      public override bool RequiresUniqueEmail
      {
         get { throw new NotImplementedException(); }
      }

      public override bool ChangePassword(string username, string oldPassword, string newPassword)
      {
         throw new NotImplementedException();
      }

      public override bool ChangePasswordQuestionAndAnswer(string username, string password, string newPasswordQuestion, string newPasswordAnswer)
      {
         throw new NotImplementedException();
      }

      public override System.Web.Security.MembershipUser CreateUser(string username, string password, string email, string passwordQuestion, string passwordAnswer, bool isApproved, object providerUserKey, out System.Web.Security.MembershipCreateStatus status)
      {
         throw new NotImplementedException();
      }

      public override bool DeleteUser(string username, bool deleteAllRelatedData)
      {
         throw new NotImplementedException();
      }

      public override System.Web.Security.MembershipUserCollection FindUsersByEmail(string emailToMatch, int pageIndex, int pageSize, out int totalRecords)
      {
         throw new NotImplementedException();
      }

      public override System.Web.Security.MembershipUserCollection FindUsersByName(string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
      {
         throw new NotImplementedException();
      }

      public override System.Web.Security.MembershipUserCollection GetAllUsers(int pageIndex, int pageSize, out int totalRecords)
      {
         throw new NotImplementedException();
      }

      public override int GetNumberOfUsersOnline()
      {
         throw new NotImplementedException();
      }

      public override string GetPassword(string username, string answer)
      {
         throw new NotImplementedException();
      }

      public override System.Web.Security.MembershipUser GetUser(string username, bool userIsOnline)
      {
         throw new NotImplementedException();
      }

      public override System.Web.Security.MembershipUser GetUser(object providerUserKey, bool userIsOnline)
      {
         throw new NotImplementedException();
      }

      public override string GetUserNameByEmail(string email)
      {
         throw new NotImplementedException();
      }

      public override string ResetPassword(string username, string answer)
      {
         throw new NotImplementedException();
      }

      public override bool UnlockUser(string userName)
      {
         throw new NotImplementedException();
      }

      public override void UpdateUser(System.Web.Security.MembershipUser user)
      {
         throw new NotImplementedException();
      }

      public override bool ValidateUser(string username, string password)
      {
         Domain.Entities.User userProfile = usersService.GetUserProfile(username);
         if (userProfile == null)
         {
            return false;
         }
         Domain.Entities.Membership membership = usersService.GetMembership(userProfile.UserId);
         if (membership == null)
         {
            return false;
         }
         if (!membership.IsConfirmed)
         {
            return false;
         }
         if (membership.PasswordSalt == usersService.GetHash(password))
         {
            return true;
         }
         // first once time we can validate through membership ConfirmationToken, 
         // to be logged in immediately after confirmation
         if (membership.ConfirmationToken != null)
         {
            if (membership.ConfirmationToken == password)
            {
               membership.ConfirmationToken = null;
               usersService.Save(membership, add: false);
               return true;
            }
         }
         return false;
      }
      #endregion MembershipProvider

      #region ExtendedMembershipProvider
      public override bool ConfirmAccount(string accountConfirmationToken)
      {
         Domain.Entities.Membership membership = usersService.GetMembershipByConfirmToken(accountConfirmationToken, withUserProfile: false);
         if (membership == null)
         {
            throw new Exception("Activation code is incorrect.");
         }
         if (membership.IsConfirmed)
         {
            throw new Exception("Your account is already activated.");
         }
         membership.IsConfirmed = true;
         usersService.Save(membership, add: false);
         return true;
      }

      public override bool ConfirmAccount(string userName, string accountConfirmationToken)
      {
         throw new NotImplementedException();
      }

      public override string CreateAccount(string userName, string password, bool requireConfirmationToken)
      {
         throw new NotImplementedException();
      }

      public override string CreateUserAndAccount(string userName /*email*/, string password, bool requireConfirmation, IDictionary<string, object> values)
      {
         userName = userName.Trim().ToLower();

         Domain.Entities.User userProfile = usersService.GetUserProfile(userName);
         if (userProfile != null)
         {
            throw new MembershipCreateUserException(MembershipCreateStatus.DuplicateEmail);
         }

         User newUserProfile = new User
            {
               Name = userName,
               Email = userName
            };
         usersService.Save(newUserProfile);

         Domain.Entities.Membership membership = new Domain.Entities.Membership
            {
               UserId = newUserProfile.UserId,
               CreateDate = DateTime.Now,
               PasswordSalt = usersService.GetHash(password),
               IsConfirmed = false,
               ConfirmationToken = Guid.NewGuid().ToString().ToLower()
            };
         usersService.Save(membership, add: true);

         return membership.ConfirmationToken;
      }

      public override bool DeleteAccount(string userName)
      {
         throw new NotImplementedException();
      }

      public override string GeneratePasswordResetToken(string userName, int tokenExpirationInMinutesFromNow)
      {
         throw new NotImplementedException();
      }

      public override ICollection<OAuthAccountData> GetAccountsForUser(string userName)
      {
         throw new NotImplementedException();
      }

      public override DateTime GetCreateDate(string userName)
      {
         throw new NotImplementedException();
      }

      public override DateTime GetLastPasswordFailureDate(string userName)
      {
         throw new NotImplementedException();
      }

      public override DateTime GetPasswordChangedDate(string userName)
      {
         throw new NotImplementedException();
      }

      public override int GetPasswordFailuresSinceLastSuccess(string userName)
      {
         throw new NotImplementedException();
      }

      public override int GetUserIdFromPasswordResetToken(string token)
      {
         throw new NotImplementedException();
      }

      public override bool IsConfirmed(string userName)
      {
         throw new NotImplementedException();
      }

      public override bool ResetPasswordWithToken(string token, string newPassword)
      {
         throw new NotImplementedException();
      }

      public override int GetUserIdFromOAuth(string provider, string providerUserId)
      {
         OAuthMembership oAuthMembership = usersService.GetOAuthMembership(provider, providerUserId);
         if (oAuthMembership != null)
         {
            return oAuthMembership.UserId;
         }
         return -1;
      }

      public override void CreateOrUpdateOAuthAccount(string provider, string providerUserId, string userName)
      {
         Domain.Entities.User userProfile = usersService.GetUserProfile(userName);
         if (userProfile == null)
         {
            throw new Exception("User profile was not created.");
         }
         usersService.SaveOAuthMembership(provider, providerUserId, userProfile.UserId);
      }

      public override string GetUserNameFromId(int userId)
      {
         Domain.Entities.User userProfile = usersService.GetUserProfile(userId);
         if (userProfile != null)
         {
            return userProfile.Name;
         }
         return null;
      }
      #endregion ExtendedMembershipProvider

      /*#region Helpers
        private const string salt = "HJIO6589";
        public static string GetHash(string text)
        {
            var buffer = Encoding.UTF8.GetBytes(String.Concat(text, salt));
            var cryptoTransformSHA1 = new SHA1CryptoServiceProvider();
            string hash = BitConverter.ToString(cryptoTransformSHA1.ComputeHash(buffer)).Replace("-", "");
            return hash;
        }
        #endregion Helpers*/
   }
}