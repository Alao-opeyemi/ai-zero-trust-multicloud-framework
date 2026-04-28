# AWS Config for continuous compliance monitoring
resource "aws_iam_role" "config_role" {
    name = "ZeroTrustAWSConfigRole"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = { Service = "config.amazonaws.com" }
    }]
 })
}
resource "aws_iam_role_policy_attachment" "config_policy" {
 role = aws_iam_role.config_role.name
 policy_arn = "arn:aws:iam::aws:policy/service-role/AWS_ConfigRole"
}
resource "aws_config_configuration_recorder" "recorder" {
 name = "zero-trust-config-recorder"
 role_arn = aws_iam_role.config_role.arn
 recording_group { all_supported = true }
}