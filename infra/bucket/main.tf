# Synthetic fixture (PLAN-208, iam suite): a bucket policy
resource "aws_s3_bucket_policy" "b" {
  bucket = "e2e-iam-bucket"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Allow", Principal = { AWS = "arn:aws:iam::111122223333:root" }, Action = "s3:GetObjectVersion", Resource = "arn:aws:s3:::e2e-iam-bucket/*" }]
  })
}
