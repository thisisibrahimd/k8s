{
  ciphers: {
    withAlgorithm(algorithm): {
      ciphers+: {
        algorithm: algorithm,
      },
    },
  },
  clients: {
    http: {
      withDisallowPrivateIpRanges(disallowPrivateIpRanges): {
        clients+: {
          http+: {
            disallow_private_ip_ranges: disallowPrivateIpRanges,
          },
        },
      },
      withPrivateIpExceptionUrls(privateIpExceptionUrls): {
        clients+: {
          http+: {
            private_ip_exception_urls: if std.isArray(v=privateIpExceptionUrls) then privateIpExceptionUrls else [privateIpExceptionUrls],
          },
        },
      },
      withPrivateIpExceptionUrlsMixin(privateIpExceptionUrls): {
        clients+: {
          http+: {
            private_ip_exception_urls+: if std.isArray(v=privateIpExceptionUrls) then privateIpExceptionUrls else [privateIpExceptionUrls],
          },
        },
      },
    },
    webHook: {
      withHeaderAllowlist(headerAllowlist): {
        clients+: {
          web_hook+: {
            header_allowlist: if std.isArray(v=headerAllowlist) then headerAllowlist else [headerAllowlist],
          },
        },
      },
      withHeaderAllowlistMixin(headerAllowlist): {
        clients+: {
          web_hook+: {
            header_allowlist+: if std.isArray(v=headerAllowlist) then headerAllowlist else [headerAllowlist],
          },
        },
      },
    },
  },
  cookies: {
    withDomain(domain): {
      cookies+: {
        domain: domain,
      },
    },
    withPath(path): {
      cookies+: {
        path: path,
      },
    },
    withSameSite(sameSite): {
      cookies+: {
        same_site: sameSite,
      },
    },
    withSecure(secure): {
      cookies+: {
        secure: secure,
      },
    },
  },
  courier: {
    http: {
      requestConfig: {
        auth: {},
        headers: {},
        withAdditionalProperties(additionalProperties): {
          courier+: {
            http+: {
              request_config+: {
                additionalProperties: additionalProperties,
              },
            },
          },
        },
        withBody(body): {
          courier+: {
            http+: {
              request_config+: {
                body: body,
              },
            },
          },
        },
        withMethod(method): {
          courier+: {
            http+: {
              request_config+: {
                method: method,
              },
            },
          },
        },
        withUrl(url): {
          courier+: {
            http+: {
              request_config+: {
                url: url,
              },
            },
          },
        },
      },
    },
    smtp: {
      headers: {},
      withClientCertPath(clientCertPath): {
        courier+: {
          smtp+: {
            client_cert_path: clientCertPath,
          },
        },
      },
      withClientKeyPath(clientKeyPath): {
        courier+: {
          smtp+: {
            client_key_path: clientKeyPath,
          },
        },
      },
      withConnectionUri(connectionUri): {
        courier+: {
          smtp+: {
            connection_uri: connectionUri,
          },
        },
      },
      withFromAddress(fromAddress): {
        courier+: {
          smtp+: {
            from_address: fromAddress,
          },
        },
      },
      withFromName(fromName): {
        courier+: {
          smtp+: {
            from_name: fromName,
          },
        },
      },
      withLocalName(localName): {
        courier+: {
          smtp+: {
            local_name: localName,
          },
        },
      },
    },
    templates: {
      loginCode: {
        valid: {
          email: {
            body: {
              withHtml(html): {
                courier+: {
                  templates+: {
                    login_code+: {
                      valid+: {
                        email+: {
                          body+: {
                            html: html,
                          },
                        },
                      },
                    },
                  },
                },
              },
              withPlaintext(plaintext): {
                courier+: {
                  templates+: {
                    login_code+: {
                      valid+: {
                        email+: {
                          body+: {
                            plaintext: plaintext,
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
            withSubject(subject): {
              courier+: {
                templates+: {
                  login_code+: {
                    valid+: {
                      email+: {
                        subject: subject,
                      },
                    },
                  },
                },
              },
            },
          },
          sms: {
            body: {
              withPlaintext(plaintext): {
                courier+: {
                  templates+: {
                    login_code+: {
                      valid+: {
                        sms+: {
                          body+: {
                            plaintext: plaintext,
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
          },
        },
      },
      recovery: {
        invalid: {
          email: {
            body: {
              withHtml(html): {
                courier+: {
                  templates+: {
                    recovery+: {
                      invalid+: {
                        email+: {
                          body+: {
                            html: html,
                          },
                        },
                      },
                    },
                  },
                },
              },
              withPlaintext(plaintext): {
                courier+: {
                  templates+: {
                    recovery+: {
                      invalid+: {
                        email+: {
                          body+: {
                            plaintext: plaintext,
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
            withSubject(subject): {
              courier+: {
                templates+: {
                  recovery+: {
                    invalid+: {
                      email+: {
                        subject: subject,
                      },
                    },
                  },
                },
              },
            },
          },
        },
        valid: {
          email: {
            body: {
              withHtml(html): {
                courier+: {
                  templates+: {
                    recovery+: {
                      valid+: {
                        email+: {
                          body+: {
                            html: html,
                          },
                        },
                      },
                    },
                  },
                },
              },
              withPlaintext(plaintext): {
                courier+: {
                  templates+: {
                    recovery+: {
                      valid+: {
                        email+: {
                          body+: {
                            plaintext: plaintext,
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
            withSubject(subject): {
              courier+: {
                templates+: {
                  recovery+: {
                    valid+: {
                      email+: {
                        subject: subject,
                      },
                    },
                  },
                },
              },
            },
          },
          sms: {
            body: {
              withPlaintext(plaintext): {
                courier+: {
                  templates+: {
                    recovery+: {
                      valid+: {
                        sms+: {
                          body+: {
                            plaintext: plaintext,
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
          },
        },
      },
      recoveryCode: {
        invalid: {
          email: {
            body: {
              withHtml(html): {
                courier+: {
                  templates+: {
                    recovery_code+: {
                      invalid+: {
                        email+: {
                          body+: {
                            html: html,
                          },
                        },
                      },
                    },
                  },
                },
              },
              withPlaintext(plaintext): {
                courier+: {
                  templates+: {
                    recovery_code+: {
                      invalid+: {
                        email+: {
                          body+: {
                            plaintext: plaintext,
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
            withSubject(subject): {
              courier+: {
                templates+: {
                  recovery_code+: {
                    invalid+: {
                      email+: {
                        subject: subject,
                      },
                    },
                  },
                },
              },
            },
          },
        },
        valid: {
          email: {
            body: {
              withHtml(html): {
                courier+: {
                  templates+: {
                    recovery_code+: {
                      valid+: {
                        email+: {
                          body+: {
                            html: html,
                          },
                        },
                      },
                    },
                  },
                },
              },
              withPlaintext(plaintext): {
                courier+: {
                  templates+: {
                    recovery_code+: {
                      valid+: {
                        email+: {
                          body+: {
                            plaintext: plaintext,
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
            withSubject(subject): {
              courier+: {
                templates+: {
                  recovery_code+: {
                    valid+: {
                      email+: {
                        subject: subject,
                      },
                    },
                  },
                },
              },
            },
          },
          sms: {
            body: {
              withPlaintext(plaintext): {
                courier+: {
                  templates+: {
                    recovery_code+: {
                      valid+: {
                        sms+: {
                          body+: {
                            plaintext: plaintext,
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
          },
        },
      },
      registrationCode: {
        valid: {
          email: {
            body: {
              withHtml(html): {
                courier+: {
                  templates+: {
                    registration_code+: {
                      valid+: {
                        email+: {
                          body+: {
                            html: html,
                          },
                        },
                      },
                    },
                  },
                },
              },
              withPlaintext(plaintext): {
                courier+: {
                  templates+: {
                    registration_code+: {
                      valid+: {
                        email+: {
                          body+: {
                            plaintext: plaintext,
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
            withSubject(subject): {
              courier+: {
                templates+: {
                  registration_code+: {
                    valid+: {
                      email+: {
                        subject: subject,
                      },
                    },
                  },
                },
              },
            },
          },
          sms: {
            body: {
              withPlaintext(plaintext): {
                courier+: {
                  templates+: {
                    registration_code+: {
                      valid+: {
                        sms+: {
                          body+: {
                            plaintext: plaintext,
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
          },
        },
      },
      verification: {
        invalid: {
          email: {
            body: {
              withHtml(html): {
                courier+: {
                  templates+: {
                    verification+: {
                      invalid+: {
                        email+: {
                          body+: {
                            html: html,
                          },
                        },
                      },
                    },
                  },
                },
              },
              withPlaintext(plaintext): {
                courier+: {
                  templates+: {
                    verification+: {
                      invalid+: {
                        email+: {
                          body+: {
                            plaintext: plaintext,
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
            withSubject(subject): {
              courier+: {
                templates+: {
                  verification+: {
                    invalid+: {
                      email+: {
                        subject: subject,
                      },
                    },
                  },
                },
              },
            },
          },
        },
        valid: {
          email: {
            body: {
              withHtml(html): {
                courier+: {
                  templates+: {
                    verification+: {
                      valid+: {
                        email+: {
                          body+: {
                            html: html,
                          },
                        },
                      },
                    },
                  },
                },
              },
              withPlaintext(plaintext): {
                courier+: {
                  templates+: {
                    verification+: {
                      valid+: {
                        email+: {
                          body+: {
                            plaintext: plaintext,
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
            withSubject(subject): {
              courier+: {
                templates+: {
                  verification+: {
                    valid+: {
                      email+: {
                        subject: subject,
                      },
                    },
                  },
                },
              },
            },
          },
          sms: {
            body: {
              withPlaintext(plaintext): {
                courier+: {
                  templates+: {
                    verification+: {
                      valid+: {
                        sms+: {
                          body+: {
                            plaintext: plaintext,
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
          },
        },
      },
      verificationCode: {
        invalid: {
          email: {
            body: {
              withHtml(html): {
                courier+: {
                  templates+: {
                    verification_code+: {
                      invalid+: {
                        email+: {
                          body+: {
                            html: html,
                          },
                        },
                      },
                    },
                  },
                },
              },
              withPlaintext(plaintext): {
                courier+: {
                  templates+: {
                    verification_code+: {
                      invalid+: {
                        email+: {
                          body+: {
                            plaintext: plaintext,
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
            withSubject(subject): {
              courier+: {
                templates+: {
                  verification_code+: {
                    invalid+: {
                      email+: {
                        subject: subject,
                      },
                    },
                  },
                },
              },
            },
          },
        },
        valid: {
          email: {
            body: {
              withHtml(html): {
                courier+: {
                  templates+: {
                    verification_code+: {
                      valid+: {
                        email+: {
                          body+: {
                            html: html,
                          },
                        },
                      },
                    },
                  },
                },
              },
              withPlaintext(plaintext): {
                courier+: {
                  templates+: {
                    verification_code+: {
                      valid+: {
                        email+: {
                          body+: {
                            plaintext: plaintext,
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
            withSubject(subject): {
              courier+: {
                templates+: {
                  verification_code+: {
                    valid+: {
                      email+: {
                        subject: subject,
                      },
                    },
                  },
                },
              },
            },
          },
          sms: {
            body: {
              withPlaintext(plaintext): {
                courier+: {
                  templates+: {
                    verification_code+: {
                      valid+: {
                        sms+: {
                          body+: {
                            plaintext: plaintext,
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
          },
        },
      },
    },
    withChannels(channels): {
      courier+: {
        channels: if std.isArray(v=channels) then channels else [channels],
      },
    },
    withChannelsMixin(channels): {
      courier+: {
        channels+: if std.isArray(v=channels) then channels else [channels],
      },
    },
    withDeliveryStrategy(deliveryStrategy): {
      courier+: {
        delivery_strategy: deliveryStrategy,
      },
    },
    withMessageRetries(messageRetries): {
      courier+: {
        message_retries: messageRetries,
      },
    },
    withTemplateOverridePath(templateOverridePath): {
      courier+: {
        template_override_path: templateOverridePath,
      },
    },
    worker: {
      withPullCount(pullCount): {
        courier+: {
          worker+: {
            pull_count: pullCount,
          },
        },
      },
      withPullWait(pullWait): {
        courier+: {
          worker+: {
            pull_wait: pullWait,
          },
        },
      },
    },
  },
  database: {
    cleanup: {
      sleep: {
        withTables(tables): {
          database+: {
            cleanup+: {
              sleep+: {
                tables: tables,
              },
            },
          },
        },
      },
      withBatchSize(batchSize): {
        database+: {
          cleanup+: {
            batch_size: batchSize,
          },
        },
      },
      withOlderThan(olderThan): {
        database+: {
          cleanup+: {
            older_than: olderThan,
          },
        },
      },
    },
  },
  enterprise: {
    withIdentitySchemaFallbackUrlTemplate(identitySchemaFallbackUrlTemplate): {
      enterprise+: {
        identity_schema_fallback_url_template: identitySchemaFallbackUrlTemplate,
      },
    },
  },
  hashers: {
    argon2: {
      withDedicatedMemory(dedicatedMemory): {
        hashers+: {
          argon2+: {
            dedicated_memory: dedicatedMemory,
          },
        },
      },
      withExpectedDeviation(expectedDeviation): {
        hashers+: {
          argon2+: {
            expected_deviation: expectedDeviation,
          },
        },
      },
      withExpectedDuration(expectedDuration): {
        hashers+: {
          argon2+: {
            expected_duration: expectedDuration,
          },
        },
      },
      withIterations(iterations): {
        hashers+: {
          argon2+: {
            iterations: iterations,
          },
        },
      },
      withKeyLength(keyLength): {
        hashers+: {
          argon2+: {
            key_length: keyLength,
          },
        },
      },
      withMemory(memory): {
        hashers+: {
          argon2+: {
            memory: memory,
          },
        },
      },
      withParallelism(parallelism): {
        hashers+: {
          argon2+: {
            parallelism: parallelism,
          },
        },
      },
      withSaltLength(saltLength): {
        hashers+: {
          argon2+: {
            salt_length: saltLength,
          },
        },
      },
    },
    bcrypt: {
      withCost(cost): {
        hashers+: {
          bcrypt+: {
            cost: cost,
          },
        },
      },
    },
    withAlgorithm(algorithm): {
      hashers+: {
        algorithm: algorithm,
      },
    },
  },
  identity: {
    withDefaultSchemaId(defaultSchemaId): {
      identity+: {
        default_schema_id: defaultSchemaId,
      },
    },
    withSchemas(schemas): {
      identity+: {
        schemas: if std.isArray(v=schemas) then schemas else [schemas],
      },
    },
    withSchemasMixin(schemas): {
      identity+: {
        schemas+: if std.isArray(v=schemas) then schemas else [schemas],
      },
    },
  },
  log: {
    withFormat(format): {
      log+: {
        format: format,
      },
    },
    withLeakSensitiveValues(leakSensitiveValues): {
      log+: {
        leak_sensitive_values: leakSensitiveValues,
      },
    },
    withLevel(level): {
      log+: {
        level: level,
      },
    },
    withRedactionText(redactionText): {
      log+: {
        redaction_text: redactionText,
      },
    },
  },
  oauth2Provider: {
    headers: {},
    withOverrideReturnTo(overrideReturnTo): {
      oauth2_provider+: {
        override_return_to: overrideReturnTo,
      },
    },
    withUrl(url): {
      oauth2_provider+: {
        url: url,
      },
    },
  },
  preview: {
    withDefaultReadConsistencyLevel(defaultReadConsistencyLevel): {
      preview+: {
        default_read_consistency_level: defaultReadConsistencyLevel,
      },
    },
  },
  secrets: {
    withCipher(cipher): {
      secrets+: {
        cipher: if std.isArray(v=cipher) then cipher else [cipher],
      },
    },
    withCipherMixin(cipher): {
      secrets+: {
        cipher+: if std.isArray(v=cipher) then cipher else [cipher],
      },
    },
    withCookie(cookie): {
      secrets+: {
        cookie: if std.isArray(v=cookie) then cookie else [cookie],
      },
    },
    withCookieMixin(cookie): {
      secrets+: {
        cookie+: if std.isArray(v=cookie) then cookie else [cookie],
      },
    },
    withDefault(default): {
      secrets+: {
        default: if std.isArray(v=default) then default else [default],
      },
    },
    withDefaultMixin(default): {
      secrets+: {
        default+: if std.isArray(v=default) then default else [default],
      },
    },
    withPagination(pagination): {
      secrets+: {
        pagination: if std.isArray(v=pagination) then pagination else [pagination],
      },
    },
    withPaginationMixin(pagination): {
      secrets+: {
        pagination+: if std.isArray(v=pagination) then pagination else [pagination],
      },
    },
  },
  security: {
    accountEnumeration: {
      withMitigate(mitigate): {
        security+: {
          account_enumeration+: {
            mitigate: mitigate,
          },
        },
      },
    },
  },
  selfservice: {
    flows: {
      'error': {
        withUiUrl(uiUrl): {
          selfservice+: {
            flows+: {
              'error'+: {
                ui_url: uiUrl,
              },
            },
          },
        },
      },
      login: {
        after: {
          code: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      code+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      code+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      code+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          lookupSecret: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      lookup_secret+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      lookup_secret+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      lookup_secret+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          oidc: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      oidc+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      oidc+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      oidc+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          passkey: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      passkey+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      passkey+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      passkey+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          password: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      password+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      password+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      password+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          totp: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      totp+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      totp+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      totp+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          webauthn: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      webauthn+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      webauthn+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  login+: {
                    after+: {
                      webauthn+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
            selfservice+: {
              flows+: {
                login+: {
                  after+: {
                    default_browser_return_url: defaultBrowserReturnUrl,
                  },
                },
              },
            },
          },
          withHooks(hooks): {
            selfservice+: {
              flows+: {
                login+: {
                  after+: {
                    hooks: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
          withHooksMixin(hooks): {
            selfservice+: {
              flows+: {
                login+: {
                  after+: {
                    hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
        },
        before: {
          withHooks(hooks): {
            selfservice+: {
              flows+: {
                login+: {
                  before+: {
                    hooks: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
          withHooksMixin(hooks): {
            selfservice+: {
              flows+: {
                login+: {
                  before+: {
                    hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
        },
        withLifespan(lifespan): {
          selfservice+: {
            flows+: {
              login+: {
                lifespan: lifespan,
              },
            },
          },
        },
        withStyle(style): {
          selfservice+: {
            flows+: {
              login+: {
                style: style,
              },
            },
          },
        },
        withUiUrl(uiUrl): {
          selfservice+: {
            flows+: {
              login+: {
                ui_url: uiUrl,
              },
            },
          },
        },
      },
      logout: {
        after: {
          withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
            selfservice+: {
              flows+: {
                logout+: {
                  after+: {
                    default_browser_return_url: defaultBrowserReturnUrl,
                  },
                },
              },
            },
          },
        },
      },
      recovery: {
        after: {
          withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
            selfservice+: {
              flows+: {
                recovery+: {
                  after+: {
                    default_browser_return_url: defaultBrowserReturnUrl,
                  },
                },
              },
            },
          },
          withHooks(hooks): {
            selfservice+: {
              flows+: {
                recovery+: {
                  after+: {
                    hooks: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
          withHooksMixin(hooks): {
            selfservice+: {
              flows+: {
                recovery+: {
                  after+: {
                    hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
        },
        before: {
          withHooks(hooks): {
            selfservice+: {
              flows+: {
                recovery+: {
                  before+: {
                    hooks: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
          withHooksMixin(hooks): {
            selfservice+: {
              flows+: {
                recovery+: {
                  before+: {
                    hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
        },
        withEnabled(enabled): {
          selfservice+: {
            flows+: {
              recovery+: {
                enabled: enabled,
              },
            },
          },
        },
        withLifespan(lifespan): {
          selfservice+: {
            flows+: {
              recovery+: {
                lifespan: lifespan,
              },
            },
          },
        },
        withNotifyUnknownRecipients(notifyUnknownRecipients): {
          selfservice+: {
            flows+: {
              recovery+: {
                notify_unknown_recipients: notifyUnknownRecipients,
              },
            },
          },
        },
        withUiUrl(uiUrl): {
          selfservice+: {
            flows+: {
              recovery+: {
                ui_url: uiUrl,
              },
            },
          },
        },
        withUse(use): {
          selfservice+: {
            flows+: {
              recovery+: {
                use: use,
              },
            },
          },
        },
      },
      registration: {
        after: {
          code: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  registration+: {
                    after+: {
                      code+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  registration+: {
                    after+: {
                      code+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  registration+: {
                    after+: {
                      code+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          oidc: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  registration+: {
                    after+: {
                      oidc+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  registration+: {
                    after+: {
                      oidc+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  registration+: {
                    after+: {
                      oidc+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          passkey: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  registration+: {
                    after+: {
                      passkey+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  registration+: {
                    after+: {
                      passkey+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  registration+: {
                    after+: {
                      passkey+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          password: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  registration+: {
                    after+: {
                      password+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  registration+: {
                    after+: {
                      password+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  registration+: {
                    after+: {
                      password+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          webauthn: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  registration+: {
                    after+: {
                      webauthn+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  registration+: {
                    after+: {
                      webauthn+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  registration+: {
                    after+: {
                      webauthn+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
            selfservice+: {
              flows+: {
                registration+: {
                  after+: {
                    default_browser_return_url: defaultBrowserReturnUrl,
                  },
                },
              },
            },
          },
          withHooks(hooks): {
            selfservice+: {
              flows+: {
                registration+: {
                  after+: {
                    hooks: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
          withHooksMixin(hooks): {
            selfservice+: {
              flows+: {
                registration+: {
                  after+: {
                    hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
        },
        before: {
          withHooks(hooks): {
            selfservice+: {
              flows+: {
                registration+: {
                  before+: {
                    hooks: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
          withHooksMixin(hooks): {
            selfservice+: {
              flows+: {
                registration+: {
                  before+: {
                    hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
        },
        withEnableLegacyOneStep(enableLegacyOneStep): {
          selfservice+: {
            flows+: {
              registration+: {
                enable_legacy_one_step: enableLegacyOneStep,
              },
            },
          },
        },
        withEnabled(enabled): {
          selfservice+: {
            flows+: {
              registration+: {
                enabled: enabled,
              },
            },
          },
        },
        withLifespan(lifespan): {
          selfservice+: {
            flows+: {
              registration+: {
                lifespan: lifespan,
              },
            },
          },
        },
        withLoginHints(loginHints): {
          selfservice+: {
            flows+: {
              registration+: {
                login_hints: loginHints,
              },
            },
          },
        },
        withStyle(style): {
          selfservice+: {
            flows+: {
              registration+: {
                style: style,
              },
            },
          },
        },
        withUiUrl(uiUrl): {
          selfservice+: {
            flows+: {
              registration+: {
                ui_url: uiUrl,
              },
            },
          },
        },
      },
      settings: {
        after: {
          lookupSecret: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      lookup_secret+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      lookup_secret+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      lookup_secret+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          oidc: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      oidc+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      oidc+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      oidc+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          passkey: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      passkey+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      passkey+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      passkey+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          password: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      password+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      password+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      password+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          profile: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      profile+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      profile+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      profile+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          totp: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      totp+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      totp+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      totp+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          webauthn: {
            withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      webauthn+: {
                        default_browser_return_url: defaultBrowserReturnUrl,
                      },
                    },
                  },
                },
              },
            },
            withHooks(hooks): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      webauthn+: {
                        hooks: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
            withHooksMixin(hooks): {
              selfservice+: {
                flows+: {
                  settings+: {
                    after+: {
                      webauthn+: {
                        hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                      },
                    },
                  },
                },
              },
            },
          },
          withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
            selfservice+: {
              flows+: {
                settings+: {
                  after+: {
                    default_browser_return_url: defaultBrowserReturnUrl,
                  },
                },
              },
            },
          },
          withHooks(hooks): {
            selfservice+: {
              flows+: {
                settings+: {
                  after+: {
                    hooks: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
          withHooksMixin(hooks): {
            selfservice+: {
              flows+: {
                settings+: {
                  after+: {
                    hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
        },
        before: {
          withHooks(hooks): {
            selfservice+: {
              flows+: {
                settings+: {
                  before+: {
                    hooks: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
          withHooksMixin(hooks): {
            selfservice+: {
              flows+: {
                settings+: {
                  before+: {
                    hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
        },
        withLifespan(lifespan): {
          selfservice+: {
            flows+: {
              settings+: {
                lifespan: lifespan,
              },
            },
          },
        },
        withPrivilegedSessionMaxAge(privilegedSessionMaxAge): {
          selfservice+: {
            flows+: {
              settings+: {
                privileged_session_max_age: privilegedSessionMaxAge,
              },
            },
          },
        },
        withRequiredAal(requiredAal): {
          selfservice+: {
            flows+: {
              settings+: {
                required_aal: requiredAal,
              },
            },
          },
        },
        withUiUrl(uiUrl): {
          selfservice+: {
            flows+: {
              settings+: {
                ui_url: uiUrl,
              },
            },
          },
        },
      },
      verification: {
        after: {
          withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
            selfservice+: {
              flows+: {
                verification+: {
                  after+: {
                    default_browser_return_url: defaultBrowserReturnUrl,
                  },
                },
              },
            },
          },
          withHooks(hooks): {
            selfservice+: {
              flows+: {
                verification+: {
                  after+: {
                    hooks: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
          withHooksMixin(hooks): {
            selfservice+: {
              flows+: {
                verification+: {
                  after+: {
                    hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
        },
        before: {
          withHooks(hooks): {
            selfservice+: {
              flows+: {
                verification+: {
                  before+: {
                    hooks: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
          withHooksMixin(hooks): {
            selfservice+: {
              flows+: {
                verification+: {
                  before+: {
                    hooks+: if std.isArray(v=hooks) then hooks else [hooks],
                  },
                },
              },
            },
          },
        },
        withEnabled(enabled): {
          selfservice+: {
            flows+: {
              verification+: {
                enabled: enabled,
              },
            },
          },
        },
        withLifespan(lifespan): {
          selfservice+: {
            flows+: {
              verification+: {
                lifespan: lifespan,
              },
            },
          },
        },
        withNotifyUnknownRecipients(notifyUnknownRecipients): {
          selfservice+: {
            flows+: {
              verification+: {
                notify_unknown_recipients: notifyUnknownRecipients,
              },
            },
          },
        },
        withUiUrl(uiUrl): {
          selfservice+: {
            flows+: {
              verification+: {
                ui_url: uiUrl,
              },
            },
          },
        },
        withUse(use): {
          selfservice+: {
            flows+: {
              verification+: {
                use: use,
              },
            },
          },
        },
      },
    },
    methods: {
      b2b: {
        config: {
          withOrganizations(organizations): {
            selfservice+: {
              methods+: {
                b2b+: {
                  config+: {
                    organizations: if std.isArray(v=organizations) then organizations else [organizations],
                  },
                },
              },
            },
          },
          withOrganizationsMixin(organizations): {
            selfservice+: {
              methods+: {
                b2b+: {
                  config+: {
                    organizations+: if std.isArray(v=organizations) then organizations else [organizations],
                  },
                },
              },
            },
          },
        },
      },
      code: {
        config: {
          withLifespan(lifespan): {
            selfservice+: {
              methods+: {
                code+: {
                  config+: {
                    lifespan: lifespan,
                  },
                },
              },
            },
          },
          withMaxSubmissions(maxSubmissions): {
            selfservice+: {
              methods+: {
                code+: {
                  config+: {
                    max_submissions: maxSubmissions,
                  },
                },
              },
            },
          },
          withMissingCredentialFallbackEnabled(missingCredentialFallbackEnabled): {
            selfservice+: {
              methods+: {
                code+: {
                  config+: {
                    missing_credential_fallback_enabled: missingCredentialFallbackEnabled,
                  },
                },
              },
            },
          },
        },
        withEnabled(enabled): {
          selfservice+: {
            methods+: {
              code+: {
                enabled: enabled,
              },
            },
          },
        },
        withMfaEnabled(mfaEnabled): {
          selfservice+: {
            methods+: {
              code+: {
                mfa_enabled: mfaEnabled,
              },
            },
          },
        },
        withPasswordlessEnabled(passwordlessEnabled): {
          selfservice+: {
            methods+: {
              code+: {
                passwordless_enabled: passwordlessEnabled,
              },
            },
          },
        },
      },
      link: {
        config: {
          withBaseUrl(baseUrl): {
            selfservice+: {
              methods+: {
                link+: {
                  config+: {
                    base_url: baseUrl,
                  },
                },
              },
            },
          },
          withLifespan(lifespan): {
            selfservice+: {
              methods+: {
                link+: {
                  config+: {
                    lifespan: lifespan,
                  },
                },
              },
            },
          },
        },
        withEnabled(enabled): {
          selfservice+: {
            methods+: {
              link+: {
                enabled: enabled,
              },
            },
          },
        },
      },
      lookupSecret: {
        withEnabled(enabled): {
          selfservice+: {
            methods+: {
              lookup_secret+: {
                enabled: enabled,
              },
            },
          },
        },
      },
      oidc: {
        config: {
          withBaseRedirectUri(baseRedirectUri): {
            selfservice+: {
              methods+: {
                oidc+: {
                  config+: {
                    base_redirect_uri: baseRedirectUri,
                  },
                },
              },
            },
          },
          withProviders(providers): {
            selfservice+: {
              methods+: {
                oidc+: {
                  config+: {
                    providers: if std.isArray(v=providers) then providers else [providers],
                  },
                },
              },
            },
          },
          withProvidersMixin(providers): {
            selfservice+: {
              methods+: {
                oidc+: {
                  config+: {
                    providers+: if std.isArray(v=providers) then providers else [providers],
                  },
                },
              },
            },
          },
        },
        withEnabled(enabled): {
          selfservice+: {
            methods+: {
              oidc+: {
                enabled: enabled,
              },
            },
          },
        },
      },
      passkey: {
        config: {
          rp: {
            withDisplayName(displayName): {
              selfservice+: {
                methods+: {
                  passkey+: {
                    config+: {
                      rp+: {
                        display_name: displayName,
                      },
                    },
                  },
                },
              },
            },
            withId(id): {
              selfservice+: {
                methods+: {
                  passkey+: {
                    config+: {
                      rp+: {
                        id: id,
                      },
                    },
                  },
                },
              },
            },
            withOrigins(origins): {
              selfservice+: {
                methods+: {
                  passkey+: {
                    config+: {
                      rp+: {
                        origins: if std.isArray(v=origins) then origins else [origins],
                      },
                    },
                  },
                },
              },
            },
            withOriginsMixin(origins): {
              selfservice+: {
                methods+: {
                  passkey+: {
                    config+: {
                      rp+: {
                        origins+: if std.isArray(v=origins) then origins else [origins],
                      },
                    },
                  },
                },
              },
            },
          },
        },
        withEnabled(enabled): {
          selfservice+: {
            methods+: {
              passkey+: {
                enabled: enabled,
              },
            },
          },
        },
      },
      password: {
        config: {
          migrateHook: {
            config: {
              auth: {},
              headers: {},
              withAdditionalProperties(additionalProperties): {
                selfservice+: {
                  methods+: {
                    password+: {
                      config+: {
                        migrate_hook+: {
                          config+: {
                            additionalProperties: additionalProperties,
                          },
                        },
                      },
                    },
                  },
                },
              },
              withBody(body): {
                selfservice+: {
                  methods+: {
                    password+: {
                      config+: {
                        migrate_hook+: {
                          config+: {
                            body: body,
                          },
                        },
                      },
                    },
                  },
                },
              },
              withEmitAnalyticsEvent(emitAnalyticsEvent): {
                selfservice+: {
                  methods+: {
                    password+: {
                      config+: {
                        migrate_hook+: {
                          config+: {
                            emit_analytics_event: emitAnalyticsEvent,
                          },
                        },
                      },
                    },
                  },
                },
              },
              withMethod(method): {
                selfservice+: {
                  methods+: {
                    password+: {
                      config+: {
                        migrate_hook+: {
                          config+: {
                            method: method,
                          },
                        },
                      },
                    },
                  },
                },
              },
              withUrl(url): {
                selfservice+: {
                  methods+: {
                    password+: {
                      config+: {
                        migrate_hook+: {
                          config+: {
                            url: url,
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
            withEnabled(enabled): {
              selfservice+: {
                methods+: {
                  password+: {
                    config+: {
                      migrate_hook+: {
                        enabled: enabled,
                      },
                    },
                  },
                },
              },
            },
          },
          withHaveibeenpwnedEnabled(haveibeenpwnedEnabled): {
            selfservice+: {
              methods+: {
                password+: {
                  config+: {
                    haveibeenpwned_enabled: haveibeenpwnedEnabled,
                  },
                },
              },
            },
          },
          withHaveibeenpwnedHost(haveibeenpwnedHost): {
            selfservice+: {
              methods+: {
                password+: {
                  config+: {
                    haveibeenpwned_host: haveibeenpwnedHost,
                  },
                },
              },
            },
          },
          withIdentifierSimilarityCheckEnabled(identifierSimilarityCheckEnabled): {
            selfservice+: {
              methods+: {
                password+: {
                  config+: {
                    identifier_similarity_check_enabled: identifierSimilarityCheckEnabled,
                  },
                },
              },
            },
          },
          withIgnoreNetworkErrors(ignoreNetworkErrors): {
            selfservice+: {
              methods+: {
                password+: {
                  config+: {
                    ignore_network_errors: ignoreNetworkErrors,
                  },
                },
              },
            },
          },
          withMaxBreaches(maxBreaches): {
            selfservice+: {
              methods+: {
                password+: {
                  config+: {
                    max_breaches: maxBreaches,
                  },
                },
              },
            },
          },
          withMinPasswordLength(minPasswordLength): {
            selfservice+: {
              methods+: {
                password+: {
                  config+: {
                    min_password_length: minPasswordLength,
                  },
                },
              },
            },
          },
        },
        withEnabled(enabled): {
          selfservice+: {
            methods+: {
              password+: {
                enabled: enabled,
              },
            },
          },
        },
      },
      profile: {
        withEnabled(enabled): {
          selfservice+: {
            methods+: {
              profile+: {
                enabled: enabled,
              },
            },
          },
        },
      },
      totp: {
        config: {
          withIssuer(issuer): {
            selfservice+: {
              methods+: {
                totp+: {
                  config+: {
                    issuer: issuer,
                  },
                },
              },
            },
          },
        },
        withEnabled(enabled): {
          selfservice+: {
            methods+: {
              totp+: {
                enabled: enabled,
              },
            },
          },
        },
      },
      webauthn: {
        config: {
          rp: {
            withDisplayName(displayName): {
              selfservice+: {
                methods+: {
                  webauthn+: {
                    config+: {
                      rp+: {
                        display_name: displayName,
                      },
                    },
                  },
                },
              },
            },
            withIcon(icon): {
              selfservice+: {
                methods+: {
                  webauthn+: {
                    config+: {
                      rp+: {
                        icon: icon,
                      },
                    },
                  },
                },
              },
            },
            withId(id): {
              selfservice+: {
                methods+: {
                  webauthn+: {
                    config+: {
                      rp+: {
                        id: id,
                      },
                    },
                  },
                },
              },
            },
            withOrigin(origin): {
              selfservice+: {
                methods+: {
                  webauthn+: {
                    config+: {
                      rp+: {
                        origin: origin,
                      },
                    },
                  },
                },
              },
            },
            withOrigins(origins): {
              selfservice+: {
                methods+: {
                  webauthn+: {
                    config+: {
                      rp+: {
                        origins: if std.isArray(v=origins) then origins else [origins],
                      },
                    },
                  },
                },
              },
            },
            withOriginsMixin(origins): {
              selfservice+: {
                methods+: {
                  webauthn+: {
                    config+: {
                      rp+: {
                        origins+: if std.isArray(v=origins) then origins else [origins],
                      },
                    },
                  },
                },
              },
            },
          },
          withPasswordless(passwordless): {
            selfservice+: {
              methods+: {
                webauthn+: {
                  config+: {
                    passwordless: passwordless,
                  },
                },
              },
            },
          },
        },
        withEnabled(enabled): {
          selfservice+: {
            methods+: {
              webauthn+: {
                enabled: enabled,
              },
            },
          },
        },
      },
    },
    withAllowedReturnUrls(allowedReturnUrls): {
      selfservice+: {
        allowed_return_urls: if std.isArray(v=allowedReturnUrls) then allowedReturnUrls else [allowedReturnUrls],
      },
    },
    withAllowedReturnUrlsMixin(allowedReturnUrls): {
      selfservice+: {
        allowed_return_urls+: if std.isArray(v=allowedReturnUrls) then allowedReturnUrls else [allowedReturnUrls],
      },
    },
    withDefaultBrowserReturnUrl(defaultBrowserReturnUrl): {
      selfservice+: {
        default_browser_return_url: defaultBrowserReturnUrl,
      },
    },
  },
  serve: {
    admin: {
      requestLog: {
        withDisableForHealth(disableForHealth): {
          serve+: {
            admin+: {
              request_log+: {
                disable_for_health: disableForHealth,
              },
            },
          },
        },
      },
      socket: {
        withGroup(group): {
          serve+: {
            admin+: {
              socket+: {
                group: group,
              },
            },
          },
        },
        withMode(mode): {
          serve+: {
            admin+: {
              socket+: {
                mode: mode,
              },
            },
          },
        },
        withOwner(owner): {
          serve+: {
            admin+: {
              socket+: {
                owner: owner,
              },
            },
          },
        },
      },
      tls: {
        withCert(cert): {
          serve+: {
            admin+: {
              tls+: {
                cert: cert,
              },
            },
          },
        },
        withKey(key): {
          serve+: {
            admin+: {
              tls+: {
                key: key,
              },
            },
          },
        },
      },
      withBaseUrl(baseUrl): {
        serve+: {
          admin+: {
            base_url: baseUrl,
          },
        },
      },
      withHost(host): {
        serve+: {
          admin+: {
            host: host,
          },
        },
      },
      withPort(port): {
        serve+: {
          admin+: {
            port: port,
          },
        },
      },
    },
    public: {
      cors: {
        withAllowCredentials(allowCredentials): {
          serve+: {
            public+: {
              cors+: {
                allow_credentials: allowCredentials,
              },
            },
          },
        },
        withAllowedHeaders(allowedHeaders): {
          serve+: {
            public+: {
              cors+: {
                allowed_headers: if std.isArray(v=allowedHeaders) then allowedHeaders else [allowedHeaders],
              },
            },
          },
        },
        withAllowedHeadersMixin(allowedHeaders): {
          serve+: {
            public+: {
              cors+: {
                allowed_headers+: if std.isArray(v=allowedHeaders) then allowedHeaders else [allowedHeaders],
              },
            },
          },
        },
        withAllowedMethods(allowedMethods): {
          serve+: {
            public+: {
              cors+: {
                allowed_methods: if std.isArray(v=allowedMethods) then allowedMethods else [allowedMethods],
              },
            },
          },
        },
        withAllowedMethodsMixin(allowedMethods): {
          serve+: {
            public+: {
              cors+: {
                allowed_methods+: if std.isArray(v=allowedMethods) then allowedMethods else [allowedMethods],
              },
            },
          },
        },
        withAllowedOrigins(allowedOrigins): {
          serve+: {
            public+: {
              cors+: {
                allowed_origins: if std.isArray(v=allowedOrigins) then allowedOrigins else [allowedOrigins],
              },
            },
          },
        },
        withAllowedOriginsMixin(allowedOrigins): {
          serve+: {
            public+: {
              cors+: {
                allowed_origins+: if std.isArray(v=allowedOrigins) then allowedOrigins else [allowedOrigins],
              },
            },
          },
        },
        withDebug(debug): {
          serve+: {
            public+: {
              cors+: {
                debug: debug,
              },
            },
          },
        },
        withEnabled(enabled): {
          serve+: {
            public+: {
              cors+: {
                enabled: enabled,
              },
            },
          },
        },
        withExposedHeaders(exposedHeaders): {
          serve+: {
            public+: {
              cors+: {
                exposed_headers: if std.isArray(v=exposedHeaders) then exposedHeaders else [exposedHeaders],
              },
            },
          },
        },
        withExposedHeadersMixin(exposedHeaders): {
          serve+: {
            public+: {
              cors+: {
                exposed_headers+: if std.isArray(v=exposedHeaders) then exposedHeaders else [exposedHeaders],
              },
            },
          },
        },
        withMaxAge(maxAge): {
          serve+: {
            public+: {
              cors+: {
                max_age: maxAge,
              },
            },
          },
        },
        withOptionsPassthrough(optionsPassthrough): {
          serve+: {
            public+: {
              cors+: {
                options_passthrough: optionsPassthrough,
              },
            },
          },
        },
      },
      requestLog: {
        withDisableForHealth(disableForHealth): {
          serve+: {
            public+: {
              request_log+: {
                disable_for_health: disableForHealth,
              },
            },
          },
        },
      },
      socket: {
        withGroup(group): {
          serve+: {
            public+: {
              socket+: {
                group: group,
              },
            },
          },
        },
        withMode(mode): {
          serve+: {
            public+: {
              socket+: {
                mode: mode,
              },
            },
          },
        },
        withOwner(owner): {
          serve+: {
            public+: {
              socket+: {
                owner: owner,
              },
            },
          },
        },
      },
      tls: {
        withCert(cert): {
          serve+: {
            public+: {
              tls+: {
                cert: cert,
              },
            },
          },
        },
        withKey(key): {
          serve+: {
            public+: {
              tls+: {
                key: key,
              },
            },
          },
        },
      },
      withBaseUrl(baseUrl): {
        serve+: {
          public+: {
            base_url: baseUrl,
          },
        },
      },
      withHost(host): {
        serve+: {
          public+: {
            host: host,
          },
        },
      },
      withPort(port): {
        serve+: {
          public+: {
            port: port,
          },
        },
      },
    },
  },
  session: {
    cookie: {
      withDomain(domain): {
        session+: {
          cookie+: {
            domain: domain,
          },
        },
      },
      withName(name): {
        session+: {
          cookie+: {
            name: name,
          },
        },
      },
      withPath(path): {
        session+: {
          cookie+: {
            path: path,
          },
        },
      },
      withPersistent(persistent): {
        session+: {
          cookie+: {
            persistent: persistent,
          },
        },
      },
      withSameSite(sameSite): {
        session+: {
          cookie+: {
            same_site: sameSite,
          },
        },
      },
      withSecure(secure): {
        session+: {
          cookie+: {
            secure: secure,
          },
        },
      },
    },
    whoami: {
      tokenizer: {
        templates: {},
      },
      withRequiredAal(requiredAal): {
        session+: {
          whoami+: {
            required_aal: requiredAal,
          },
        },
      },
    },
    withEarliestPossibleExtend(earliestPossibleExtend): {
      session+: {
        earliest_possible_extend: earliestPossibleExtend,
      },
    },
    withLifespan(lifespan): {
      session+: {
        lifespan: lifespan,
      },
    },
  },
  tracing: {
    providers: {
      jaeger: {
        sampling: {
          withServerUrl(serverUrl): {
            tracing+: {
              providers+: {
                jaeger+: {
                  sampling+: {
                    server_url: serverUrl,
                  },
                },
              },
            },
          },
          withTraceIdRatio(traceIdRatio): {
            tracing+: {
              providers+: {
                jaeger+: {
                  sampling+: {
                    trace_id_ratio: traceIdRatio,
                  },
                },
              },
            },
          },
        },
        withLocalAgentAddress(localAgentAddress): {
          tracing+: {
            providers+: {
              jaeger+: {
                local_agent_address: localAgentAddress,
              },
            },
          },
        },
      },
      otlp: {
        sampling: {
          withSamplingRatio(samplingRatio): {
            tracing+: {
              providers+: {
                otlp+: {
                  sampling+: {
                    sampling_ratio: samplingRatio,
                  },
                },
              },
            },
          },
        },
        withAuthorizationHeader(authorizationHeader): {
          tracing+: {
            providers+: {
              otlp+: {
                authorization_header: authorizationHeader,
              },
            },
          },
        },
        withInsecure(insecure): {
          tracing+: {
            providers+: {
              otlp+: {
                insecure: insecure,
              },
            },
          },
        },
        withServerUrl(serverUrl): {
          tracing+: {
            providers+: {
              otlp+: {
                server_url: serverUrl,
              },
            },
          },
        },
      },
      zipkin: {
        sampling: {
          withSamplingRatio(samplingRatio): {
            tracing+: {
              providers+: {
                zipkin+: {
                  sampling+: {
                    sampling_ratio: samplingRatio,
                  },
                },
              },
            },
          },
        },
        withServerUrl(serverUrl): {
          tracing+: {
            providers+: {
              zipkin+: {
                server_url: serverUrl,
              },
            },
          },
        },
      },
    },
    withDeploymentEnvironment(deploymentEnvironment): {
      tracing+: {
        deployment_environment: deploymentEnvironment,
      },
    },
    withProvider(provider): {
      tracing+: {
        provider: provider,
      },
    },
    withServiceName(serviceName): {
      tracing+: {
        service_name: serviceName,
      },
    },
  },
  withConfig(config): {
    config: if std.isArray(v=config) then config else [config],
  },
  withConfigMixin(config): {
    config+: if std.isArray(v=config) then config else [config],
  },
  withDev(dev): {
    dev: dev,
  },
  withDsn(dsn): {
    dsn: dsn,
  },
  withExposeMetricsPort(exposeMetricsPort): {
    'expose-metrics-port': exposeMetricsPort,
  },
  withFeatureFlags(featureFlags): {
    feature_flags: featureFlags,
  },
  withHelp(help): {
    help: help,
  },
  withOrganizations(organizations): {
    organizations: if std.isArray(v=organizations) then organizations else [organizations],
  },
  withOrganizationsMixin(organizations): {
    organizations+: if std.isArray(v=organizations) then organizations else [organizations],
  },
  withRevision(revision): {
    revision: revision,
  },
  withSqaOptOut(sqaOptOut): {
    'sqa-opt-out': sqaOptOut,
  },
  withVersion(version): {
    version: version,
  },
  withWatchCourier(watchCourier): {
    'watch-courier': watchCourier,
  },
}
