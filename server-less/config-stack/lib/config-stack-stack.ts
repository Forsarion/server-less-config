import * as cdk from '@aws-cdk/core'
// import * as s3 from '@aws-cdk/aws-s3'
import * as lambda from '@aws-cdk/aws-lambda'
import * as apigateway from '@aws-cdk/aws-apigateway'
import { LayerVersion } from '@aws-cdk/aws-lambda';

export class ConfigStackStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // const bucket = new s3.Bucket(this, "SwiftLayers");
    
    const layer = LayerVersion.fromLayerVersionArn(this, 'Swift51', 'arn:aws:lambda:eu-central-1:721126196132:layer:Swift51:4')
    
    const handler = new lambda.Function(this, 'ConfigHandler',
    {
      runtime: lambda.Runtime.PROVIDED,
      code: lambda.Code.fromAsset('../config/lambda.zip'),
      handler: 'lambda.lambda',
      layers: [layer]
    })

    const api = new apigateway.RestApi(this, "config-handler-api", {
      restApiName: "Config Service",
      description: "Config Service API Gateway"
    })

    const postConfigIntegration = new apigateway.LambdaIntegration(handler)

    api.root.addMethod('POST', postConfigIntegration)
  }
}
