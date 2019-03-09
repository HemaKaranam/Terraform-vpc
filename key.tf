resource "aws_key_pair" "drupal-key" {
	key_name   = "drupal-key"
	public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD0+jXfEjgEBhQtEg9bMBcp4mcVmZIFxCXYofDY6Q3aPOcuoXXoaqBS4haY7sakeIY5CQcryvjP6h6Ld6LURyV6iXJA4n3e3XMmyhj05vx4FtpMoRgakK23v5cVRUOd7YQNoDdD4aaM/0oV7C+4bzuWpPwvygJkApMexHL3+dBGXaXZc1pO2J89Fhjk8A404pcDR4DpcP3vfXDAqTCfvsDKIVIWEulT+Kiora2uRtkSU2aM2XPo+uhK4/ifiNpM+NLxx3W12kdW595u4YyP7PdIF+RFN9OvofE75Xl9LwAftAovaAseIn1XrGDrVrKR5kB/rvzsDRyy4drf337mvVqr ec2-user@ip-172-31-40-113.us-east-2.compute.internal"
}
