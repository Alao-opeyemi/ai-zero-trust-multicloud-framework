# Least privilege S3 read policy with MFA condition
resource "aws_iam_policy" "least_privilege_s3_read" {
 name = "ZeroTrustLeastPrivilegeS3Read"
 description = "Least privilege read-only S3 access requiring MFA"
 policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
        Effect = "Allow"
        Action = ["s3:GetObject", "s3:ListBucket"]
        Resource = "*"
        Condition = {
            BoolIfExists = { "aws:MultiFactorAuthPresent" = "true" }
        }
    }]
 })
}

# Strict account-level password policy
resource "aws_iam_account_password_policy" "strict_policy" {
 minimum_password_length = 16
 require_uppercase_characters = true
 require_lowercase_characters = true
 require_numbers = true
 require_symbols = true
 allow_users_to_change_password = true
 max_password_age = 90
 password_reuse_prevention = 12
}
