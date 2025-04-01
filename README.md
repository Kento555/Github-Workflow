# Github-Workflow
Github Workflow

3 Workflows in this repo:
- Basic
- Terraform Apply (using OIDC)
- Terraform Destroy (using AWS Secret Key)

Initial AWS Credential:
 - name: Configure AWS Credentials
      uses: aws-actions/configure-aws-credentials@v1
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: ${{ env.AWS_REGION }}

Alternative to use OIDC:
OIDC (OpenID Connect) in GitHub Actions is a secure, modern way to access AWS without storing long-lived AWS Access Keys as GitHub Secrets.
It uses short-term credentials and is much safer, and now recommended by AWS and GitHub.

🎯 Why use OIDC?
✅ No need to store AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY in your repo
✅ GitHub will automatically assume an AWS role using a trust policy
✅ Credentials are short-lived and auto-rotated per workflow
✅ More secure and manageable in production pipelines.

How to set up OIDC for GitHub Actions + AWS
1. Create an IAM Role for OIDC
Go to AWS IAM → Roles → Create Role →
Trusted Entity Type:
✅ Web Identity
✅ Provider: GitHub
✅ Audience: sts.amazonaws.com

Separately, you will need to attach a Permission Policy to the role (e.g.):
AmazonS3FullAccess
AmazonEC2FullAccess

Policy Type	Purpose
Trust Policy:	Who can assume the role (OIDC GitHub, federated user)
Permission Policy:	What the role is allowed to do (S3, EC2, etc.)


You are using aws-actions/configure-aws-credentials@v1
→ **OIDC support requires at least v2!
→ v1 only supports access key-based authentication.
You are using an extra field audience: sts.amazonaws.com → this is optional and not required in OIDC setup anymore. AWS uses sts.amazonaws.com by default.
✅ Use v2 or later of configure-aws-credentials
✅ Add permissions: id-token: write
✅ Remove unnecessary audience input
✅ Your Trust Policy in AWS role should allow your GitHub repo