# GuardDuty for AI-driven threat detection
resource "aws_guardduty_detector" "main" {
 enable = true
}
# Enable GuardDuty S3 protection
resource "aws_guardduty_detector_feature" "s3_logs" {
 detector_id = aws_guardduty_detector.main.id
 name = "S3_DATA_EVENTS"
  status = "ENABLED"
}
# Enable GuardDuty malware protection
resource "aws_guardduty_detector_feature" "malware_protection" {
 detector_id = aws_guardduty_detector.main.id
 name = "EBS_MALWARE_PROTECTION"
 status = "ENABLED"
}
