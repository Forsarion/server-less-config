# Setup Requirements
- Amazon Web Services Account
- Docker
- `brew install aws-cli`
- Xcode 11 (only for iOS app)
- VS Code and AWS Toolkit extension

**Required for AWS CDK development:**
- `brew install aws-cdk`
- node and npm

# Monorepo structure

`frontend/ConfigDemo` - iOS app written using SwiftUI

`server-less/config` - Lambda code written in Swift

`server-less/config/core` - Shareable code between iOS app and Lambda

`server-less/config/lambda` - Lambda code itself

`server-less/config-stack` - AWS CDK project that allows to setup cloud with one command 
