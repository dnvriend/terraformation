package com.github.dnvriend

import com.amazonaws.auth.{BasicAWSCredentials, STSSessionCredentialsProvider}

class TemporaryCredentialsTest extends TestSpec {
  it should "fooo" in {
//    val assumeRoleResult = AssumeRole("")
    val tempCreds = STSSessionCredentialsProvider
    BasicAWSCredentials

  }
}
