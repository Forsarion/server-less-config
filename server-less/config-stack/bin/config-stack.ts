#!/usr/bin/env node
import 'source-map-support/register';
import * as cdk from '@aws-cdk/core';
import { ConfigStackStack } from '../lib/config-stack-stack';

const app = new cdk.App();
new ConfigStackStack(app, 'ConfigStackStack');
