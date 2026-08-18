{
  formatters: {
    exclusions: {
      withGenerated(generated): {
        formatters+: {
          exclusions+: {
            generated: generated,
          },
        },
      },
      withPaths(paths): {
        formatters+: {
          exclusions+: {
            paths: if std.isArray(v=paths) then paths else [paths],
          },
        },
      },
      withPathsMixin(paths): {
        formatters+: {
          exclusions+: {
            paths+: if std.isArray(v=paths) then paths else [paths],
          },
        },
      },
      withWarnUnused(warnUnused): {
        formatters+: {
          exclusions+: {
            'warn-unused': warnUnused,
          },
        },
      },
    },
    settings: {
      gci: {
        withCustomOrder(customOrder): {
          formatters+: {
            settings+: {
              gci+: {
                'custom-order': customOrder,
              },
            },
          },
        },
        withNoInlineComments(noInlineComments): {
          formatters+: {
            settings+: {
              gci+: {
                'no-inline-comments': noInlineComments,
              },
            },
          },
        },
        withNoLexOrder(noLexOrder): {
          formatters+: {
            settings+: {
              gci+: {
                'no-lex-order': noLexOrder,
              },
            },
          },
        },
        withNoPrefixComments(noPrefixComments): {
          formatters+: {
            settings+: {
              gci+: {
                'no-prefix-comments': noPrefixComments,
              },
            },
          },
        },
        withSections(sections): {
          formatters+: {
            settings+: {
              gci+: {
                sections: if std.isArray(v=sections) then sections else [sections],
              },
            },
          },
        },
        withSectionsMixin(sections): {
          formatters+: {
            settings+: {
              gci+: {
                sections+: if std.isArray(v=sections) then sections else [sections],
              },
            },
          },
        },
      },
      gofmt: {
        withRewriteRules(rewriteRules): {
          formatters+: {
            settings+: {
              gofmt+: {
                'rewrite-rules': if std.isArray(v=rewriteRules) then rewriteRules else [rewriteRules],
              },
            },
          },
        },
        withRewriteRulesMixin(rewriteRules): {
          formatters+: {
            settings+: {
              gofmt+: {
                'rewrite-rules'+: if std.isArray(v=rewriteRules) then rewriteRules else [rewriteRules],
              },
            },
          },
        },
        withSimplify(simplify): {
          formatters+: {
            settings+: {
              gofmt+: {
                simplify: simplify,
              },
            },
          },
        },
      },
      gofumpt: {
        withExtraRules(extraRules): {
          formatters+: {
            settings+: {
              gofumpt+: {
                'extra-rules': extraRules,
              },
            },
          },
        },
        withModulePath(modulePath): {
          formatters+: {
            settings+: {
              gofumpt+: {
                'module-path': modulePath,
              },
            },
          },
        },
      },
      goimports: {
        withLocalPrefixes(localPrefixes): {
          formatters+: {
            settings+: {
              goimports+: {
                'local-prefixes': if std.isArray(v=localPrefixes) then localPrefixes else [localPrefixes],
              },
            },
          },
        },
        withLocalPrefixesMixin(localPrefixes): {
          formatters+: {
            settings+: {
              goimports+: {
                'local-prefixes'+: if std.isArray(v=localPrefixes) then localPrefixes else [localPrefixes],
              },
            },
          },
        },
      },
      golines: {
        withChainSplitDots(chainSplitDots): {
          formatters+: {
            settings+: {
              golines+: {
                'chain-split-dots': chainSplitDots,
              },
            },
          },
        },
        withMaxLen(maxLen): {
          formatters+: {
            settings+: {
              golines+: {
                'max-len': maxLen,
              },
            },
          },
        },
        withReformatTags(reformatTags): {
          formatters+: {
            settings+: {
              golines+: {
                'reformat-tags': reformatTags,
              },
            },
          },
        },
        withShortenComments(shortenComments): {
          formatters+: {
            settings+: {
              golines+: {
                'shorten-comments': shortenComments,
              },
            },
          },
        },
        withTabLen(tabLen): {
          formatters+: {
            settings+: {
              golines+: {
                'tab-len': tabLen,
              },
            },
          },
        },
      },
    },
    withEnable(enable): {
      formatters+: {
        enable: if std.isArray(v=enable) then enable else [enable],
      },
    },
    withEnableMixin(enable): {
      formatters+: {
        enable+: if std.isArray(v=enable) then enable else [enable],
      },
    },
  },
  issues: {
    withFix(fix): {
      issues+: {
        fix: fix,
      },
    },
    withMaxIssuesPerLinter(maxIssuesPerLinter): {
      issues+: {
        'max-issues-per-linter': maxIssuesPerLinter,
      },
    },
    withMaxSameIssues(maxSameIssues): {
      issues+: {
        'max-same-issues': maxSameIssues,
      },
    },
    withNew(new): {
      issues+: {
        new: new,
      },
    },
    withNewFromMergeBase(newFromMergeBase): {
      issues+: {
        'new-from-merge-base': newFromMergeBase,
      },
    },
    withNewFromPatch(newFromPatch): {
      issues+: {
        'new-from-patch': newFromPatch,
      },
    },
    withNewFromRev(newFromRev): {
      issues+: {
        'new-from-rev': newFromRev,
      },
    },
    withUniqByLine(uniqByLine): {
      issues+: {
        'uniq-by-line': uniqByLine,
      },
    },
    withWholeFiles(wholeFiles): {
      issues+: {
        'whole-files': wholeFiles,
      },
    },
  },
  linters: {
    exclusions: {
      withGenerated(generated): {
        linters+: {
          exclusions+: {
            generated: generated,
          },
        },
      },
      withPaths(paths): {
        linters+: {
          exclusions+: {
            paths: if std.isArray(v=paths) then paths else [paths],
          },
        },
      },
      withPathsExcept(pathsExcept): {
        linters+: {
          exclusions+: {
            'paths-except': if std.isArray(v=pathsExcept) then pathsExcept else [pathsExcept],
          },
        },
      },
      withPathsExceptMixin(pathsExcept): {
        linters+: {
          exclusions+: {
            'paths-except'+: if std.isArray(v=pathsExcept) then pathsExcept else [pathsExcept],
          },
        },
      },
      withPathsMixin(paths): {
        linters+: {
          exclusions+: {
            paths+: if std.isArray(v=paths) then paths else [paths],
          },
        },
      },
      withPresets(presets): {
        linters+: {
          exclusions+: {
            presets: if std.isArray(v=presets) then presets else [presets],
          },
        },
      },
      withPresetsMixin(presets): {
        linters+: {
          exclusions+: {
            presets+: if std.isArray(v=presets) then presets else [presets],
          },
        },
      },
      withRules(rules): {
        linters+: {
          exclusions+: {
            rules: if std.isArray(v=rules) then rules else [rules],
          },
        },
      },
      withRulesMixin(rules): {
        linters+: {
          exclusions+: {
            rules+: if std.isArray(v=rules) then rules else [rules],
          },
        },
      },
      withWarnUnused(warnUnused): {
        linters+: {
          exclusions+: {
            'warn-unused': warnUnused,
          },
        },
      },
    },
    settings: {
      asasalint: {
        withExclude(exclude): {
          linters+: {
            settings+: {
              asasalint+: {
                exclude: if std.isArray(v=exclude) then exclude else [exclude],
              },
            },
          },
        },
        withExcludeMixin(exclude): {
          linters+: {
            settings+: {
              asasalint+: {
                exclude+: if std.isArray(v=exclude) then exclude else [exclude],
              },
            },
          },
        },
        withUseBuiltinExclusions(useBuiltinExclusions): {
          linters+: {
            settings+: {
              asasalint+: {
                'use-builtin-exclusions': useBuiltinExclusions,
              },
            },
          },
        },
      },
      bidichk: {
        withFirstStrongIsolate(firstStrongIsolate): {
          linters+: {
            settings+: {
              bidichk+: {
                'first-strong-isolate': firstStrongIsolate,
              },
            },
          },
        },
        withLeftToRightEmbedding(leftToRightEmbedding): {
          linters+: {
            settings+: {
              bidichk+: {
                'left-to-right-embedding': leftToRightEmbedding,
              },
            },
          },
        },
        withLeftToRightIsolate(leftToRightIsolate): {
          linters+: {
            settings+: {
              bidichk+: {
                'left-to-right-isolate': leftToRightIsolate,
              },
            },
          },
        },
        withLeftToRightOverride(leftToRightOverride): {
          linters+: {
            settings+: {
              bidichk+: {
                'left-to-right-override': leftToRightOverride,
              },
            },
          },
        },
        withPopDirectionalFormatting(popDirectionalFormatting): {
          linters+: {
            settings+: {
              bidichk+: {
                'pop-directional-formatting': popDirectionalFormatting,
              },
            },
          },
        },
        withPopDirectionalIsolate(popDirectionalIsolate): {
          linters+: {
            settings+: {
              bidichk+: {
                'pop-directional-isolate': popDirectionalIsolate,
              },
            },
          },
        },
        withRightToLeftEmbedding(rightToLeftEmbedding): {
          linters+: {
            settings+: {
              bidichk+: {
                'right-to-left-embedding': rightToLeftEmbedding,
              },
            },
          },
        },
        withRightToLeftIsolate(rightToLeftIsolate): {
          linters+: {
            settings+: {
              bidichk+: {
                'right-to-left-isolate': rightToLeftIsolate,
              },
            },
          },
        },
        withRightToLeftOverride(rightToLeftOverride): {
          linters+: {
            settings+: {
              bidichk+: {
                'right-to-left-override': rightToLeftOverride,
              },
            },
          },
        },
      },
      bodyclose: {
        withCheckConsumption(checkConsumption): {
          linters+: {
            settings+: {
              bodyclose+: {
                'check-consumption': checkConsumption,
              },
            },
          },
        },
      },
      copyloopvar: {
        withCheckAlias(checkAlias): {
          linters+: {
            settings+: {
              copyloopvar+: {
                'check-alias': checkAlias,
              },
            },
          },
        },
      },
      custom: {},
      cyclop: {
        withMaxComplexity(maxComplexity): {
          linters+: {
            settings+: {
              cyclop+: {
                'max-complexity': maxComplexity,
              },
            },
          },
        },
        withPackageAverage(packageAverage): {
          linters+: {
            settings+: {
              cyclop+: {
                'package-average': packageAverage,
              },
            },
          },
        },
      },
      decorder: {
        withDecOrder(decOrder): {
          linters+: {
            settings+: {
              decorder+: {
                'dec-order': if std.isArray(v=decOrder) then decOrder else [decOrder],
              },
            },
          },
        },
        withDecOrderMixin(decOrder): {
          linters+: {
            settings+: {
              decorder+: {
                'dec-order'+: if std.isArray(v=decOrder) then decOrder else [decOrder],
              },
            },
          },
        },
        withDisableConstDecNumCheck(disableConstDecNumCheck): {
          linters+: {
            settings+: {
              decorder+: {
                'disable-const-dec-num-check': disableConstDecNumCheck,
              },
            },
          },
        },
        withDisableDecNumCheck(disableDecNumCheck): {
          linters+: {
            settings+: {
              decorder+: {
                'disable-dec-num-check': disableDecNumCheck,
              },
            },
          },
        },
        withDisableDecOrderCheck(disableDecOrderCheck): {
          linters+: {
            settings+: {
              decorder+: {
                'disable-dec-order-check': disableDecOrderCheck,
              },
            },
          },
        },
        withDisableInitFuncFirstCheck(disableInitFuncFirstCheck): {
          linters+: {
            settings+: {
              decorder+: {
                'disable-init-func-first-check': disableInitFuncFirstCheck,
              },
            },
          },
        },
        withDisableTypeDecNumCheck(disableTypeDecNumCheck): {
          linters+: {
            settings+: {
              decorder+: {
                'disable-type-dec-num-check': disableTypeDecNumCheck,
              },
            },
          },
        },
        withDisableVarDecNumCheck(disableVarDecNumCheck): {
          linters+: {
            settings+: {
              decorder+: {
                'disable-var-dec-num-check': disableVarDecNumCheck,
              },
            },
          },
        },
        withIgnoreUnderscoreVars(ignoreUnderscoreVars): {
          linters+: {
            settings+: {
              decorder+: {
                'ignore-underscore-vars': ignoreUnderscoreVars,
              },
            },
          },
        },
      },
      depguard: {
        rules: {},
      },
      dogsled: {
        withMaxBlankIdentifiers(maxBlankIdentifiers): {
          linters+: {
            settings+: {
              dogsled+: {
                'max-blank-identifiers': maxBlankIdentifiers,
              },
            },
          },
        },
      },
      dupl: {
        withThreshold(threshold): {
          linters+: {
            settings+: {
              dupl+: {
                threshold: threshold,
              },
            },
          },
        },
      },
      dupword: {
        withCommentsOnly(commentsOnly): {
          linters+: {
            settings+: {
              dupword+: {
                'comments-only': commentsOnly,
              },
            },
          },
        },
        withIgnore(ignore): {
          linters+: {
            settings+: {
              dupword+: {
                ignore: if std.isArray(v=ignore) then ignore else [ignore],
              },
            },
          },
        },
        withIgnoreMixin(ignore): {
          linters+: {
            settings+: {
              dupword+: {
                ignore+: if std.isArray(v=ignore) then ignore else [ignore],
              },
            },
          },
        },
        withKeywords(keywords): {
          linters+: {
            settings+: {
              dupword+: {
                keywords: if std.isArray(v=keywords) then keywords else [keywords],
              },
            },
          },
        },
        withKeywordsMixin(keywords): {
          linters+: {
            settings+: {
              dupword+: {
                keywords+: if std.isArray(v=keywords) then keywords else [keywords],
              },
            },
          },
        },
      },
      embeddedstructfieldcheck: {
        withEmptyLine(emptyLine): {
          linters+: {
            settings+: {
              embeddedstructfieldcheck+: {
                'empty-line': emptyLine,
              },
            },
          },
        },
        withForbidMutex(forbidMutex): {
          linters+: {
            settings+: {
              embeddedstructfieldcheck+: {
                'forbid-mutex': forbidMutex,
              },
            },
          },
        },
      },
      errcheck: {
        withCheckBlank(checkBlank): {
          linters+: {
            settings+: {
              errcheck+: {
                'check-blank': checkBlank,
              },
            },
          },
        },
        withCheckTypeAssertions(checkTypeAssertions): {
          linters+: {
            settings+: {
              errcheck+: {
                'check-type-assertions': checkTypeAssertions,
              },
            },
          },
        },
        withDisableDefaultExclusions(disableDefaultExclusions): {
          linters+: {
            settings+: {
              errcheck+: {
                'disable-default-exclusions': disableDefaultExclusions,
              },
            },
          },
        },
        withExcludeFunctions(excludeFunctions): {
          linters+: {
            settings+: {
              errcheck+: {
                'exclude-functions': if std.isArray(v=excludeFunctions) then excludeFunctions else [excludeFunctions],
              },
            },
          },
        },
        withExcludeFunctionsMixin(excludeFunctions): {
          linters+: {
            settings+: {
              errcheck+: {
                'exclude-functions'+: if std.isArray(v=excludeFunctions) then excludeFunctions else [excludeFunctions],
              },
            },
          },
        },
        withVerbose(verbose): {
          linters+: {
            settings+: {
              errcheck+: {
                verbose: verbose,
              },
            },
          },
        },
      },
      errchkjson: {
        withCheckErrorFreeEncoding(checkErrorFreeEncoding): {
          linters+: {
            settings+: {
              errchkjson+: {
                'check-error-free-encoding': checkErrorFreeEncoding,
              },
            },
          },
        },
        withReportNoExported(reportNoExported): {
          linters+: {
            settings+: {
              errchkjson+: {
                'report-no-exported': reportNoExported,
              },
            },
          },
        },
      },
      errorlint: {
        withAllowedErrors(allowedErrors): {
          linters+: {
            settings+: {
              errorlint+: {
                'allowed-errors': if std.isArray(v=allowedErrors) then allowedErrors else [allowedErrors],
              },
            },
          },
        },
        withAllowedErrorsMixin(allowedErrors): {
          linters+: {
            settings+: {
              errorlint+: {
                'allowed-errors'+: if std.isArray(v=allowedErrors) then allowedErrors else [allowedErrors],
              },
            },
          },
        },
        withAllowedErrorsWildcard(allowedErrorsWildcard): {
          linters+: {
            settings+: {
              errorlint+: {
                'allowed-errors-wildcard': if std.isArray(v=allowedErrorsWildcard) then allowedErrorsWildcard else [allowedErrorsWildcard],
              },
            },
          },
        },
        withAllowedErrorsWildcardMixin(allowedErrorsWildcard): {
          linters+: {
            settings+: {
              errorlint+: {
                'allowed-errors-wildcard'+: if std.isArray(v=allowedErrorsWildcard) then allowedErrorsWildcard else [allowedErrorsWildcard],
              },
            },
          },
        },
        withAsserts(asserts): {
          linters+: {
            settings+: {
              errorlint+: {
                asserts: asserts,
              },
            },
          },
        },
        withComparison(comparison): {
          linters+: {
            settings+: {
              errorlint+: {
                comparison: comparison,
              },
            },
          },
        },
        withErrorf(errorf): {
          linters+: {
            settings+: {
              errorlint+: {
                errorf: errorf,
              },
            },
          },
        },
        withErrorfMulti(errorfMulti): {
          linters+: {
            settings+: {
              errorlint+: {
                'errorf-multi': errorfMulti,
              },
            },
          },
        },
      },
      exhaustive: {
        withCheck(check): {
          linters+: {
            settings+: {
              exhaustive+: {
                check: if std.isArray(v=check) then check else [check],
              },
            },
          },
        },
        withCheckMixin(check): {
          linters+: {
            settings+: {
              exhaustive+: {
                check+: if std.isArray(v=check) then check else [check],
              },
            },
          },
        },
        withDefaultCaseRequired(defaultCaseRequired): {
          linters+: {
            settings+: {
              exhaustive+: {
                'default-case-required': defaultCaseRequired,
              },
            },
          },
        },
        withDefaultSignifiesExhaustive(defaultSignifiesExhaustive): {
          linters+: {
            settings+: {
              exhaustive+: {
                'default-signifies-exhaustive': defaultSignifiesExhaustive,
              },
            },
          },
        },
        withExplicitExhaustiveMap(explicitExhaustiveMap): {
          linters+: {
            settings+: {
              exhaustive+: {
                'explicit-exhaustive-map': explicitExhaustiveMap,
              },
            },
          },
        },
        withExplicitExhaustiveSwitch(explicitExhaustiveSwitch): {
          linters+: {
            settings+: {
              exhaustive+: {
                'explicit-exhaustive-switch': explicitExhaustiveSwitch,
              },
            },
          },
        },
        withIgnoreEnumMembers(ignoreEnumMembers): {
          linters+: {
            settings+: {
              exhaustive+: {
                'ignore-enum-members': ignoreEnumMembers,
              },
            },
          },
        },
        withIgnoreEnumTypes(ignoreEnumTypes): {
          linters+: {
            settings+: {
              exhaustive+: {
                'ignore-enum-types': ignoreEnumTypes,
              },
            },
          },
        },
        withPackageScopeOnly(packageScopeOnly): {
          linters+: {
            settings+: {
              exhaustive+: {
                'package-scope-only': packageScopeOnly,
              },
            },
          },
        },
      },
      exhaustruct: {
        withAllowEmpty(allowEmpty): {
          linters+: {
            settings+: {
              exhaustruct+: {
                'allow-empty': allowEmpty,
              },
            },
          },
        },
        withAllowEmptyDeclarations(allowEmptyDeclarations): {
          linters+: {
            settings+: {
              exhaustruct+: {
                'allow-empty-declarations': allowEmptyDeclarations,
              },
            },
          },
        },
        withAllowEmptyReturns(allowEmptyReturns): {
          linters+: {
            settings+: {
              exhaustruct+: {
                'allow-empty-returns': allowEmptyReturns,
              },
            },
          },
        },
        withAllowEmptyRx(allowEmptyRx): {
          linters+: {
            settings+: {
              exhaustruct+: {
                'allow-empty-rx': if std.isArray(v=allowEmptyRx) then allowEmptyRx else [allowEmptyRx],
              },
            },
          },
        },
        withAllowEmptyRxMixin(allowEmptyRx): {
          linters+: {
            settings+: {
              exhaustruct+: {
                'allow-empty-rx'+: if std.isArray(v=allowEmptyRx) then allowEmptyRx else [allowEmptyRx],
              },
            },
          },
        },
        withExclude(exclude): {
          linters+: {
            settings+: {
              exhaustruct+: {
                exclude: if std.isArray(v=exclude) then exclude else [exclude],
              },
            },
          },
        },
        withExcludeMixin(exclude): {
          linters+: {
            settings+: {
              exhaustruct+: {
                exclude+: if std.isArray(v=exclude) then exclude else [exclude],
              },
            },
          },
        },
        withInclude(include): {
          linters+: {
            settings+: {
              exhaustruct+: {
                include: if std.isArray(v=include) then include else [include],
              },
            },
          },
        },
        withIncludeMixin(include): {
          linters+: {
            settings+: {
              exhaustruct+: {
                include+: if std.isArray(v=include) then include else [include],
              },
            },
          },
        },
      },
      fatcontext: {
        withCheckStructPointers(checkStructPointers): {
          linters+: {
            settings+: {
              fatcontext+: {
                'check-struct-pointers': checkStructPointers,
              },
            },
          },
        },
      },
      forbidigo: {
        withAnalyzeTypes(analyzeTypes): {
          linters+: {
            settings+: {
              forbidigo+: {
                'analyze-types': analyzeTypes,
              },
            },
          },
        },
        withExcludeGodocExamples(excludeGodocExamples): {
          linters+: {
            settings+: {
              forbidigo+: {
                'exclude-godoc-examples': excludeGodocExamples,
              },
            },
          },
        },
        withForbid(forbid): {
          linters+: {
            settings+: {
              forbidigo+: {
                forbid: if std.isArray(v=forbid) then forbid else [forbid],
              },
            },
          },
        },
        withForbidMixin(forbid): {
          linters+: {
            settings+: {
              forbidigo+: {
                forbid+: if std.isArray(v=forbid) then forbid else [forbid],
              },
            },
          },
        },
      },
      funcorder: {
        withAlphabetical(alphabetical): {
          linters+: {
            settings+: {
              funcorder+: {
                alphabetical: alphabetical,
              },
            },
          },
        },
        withConstructor(constructor): {
          linters+: {
            settings+: {
              funcorder+: {
                constructor: constructor,
              },
            },
          },
        },
        withFunction(function_): {
          linters+: {
            settings+: {
              funcorder+: {
                'function': function_,
              },
            },
          },
        },
        withStructMethod(structMethod): {
          linters+: {
            settings+: {
              funcorder+: {
                'struct-method': structMethod,
              },
            },
          },
        },
      },
      funlen: {
        withIgnoreComments(ignoreComments): {
          linters+: {
            settings+: {
              funlen+: {
                'ignore-comments': ignoreComments,
              },
            },
          },
        },
        withLines(lines): {
          linters+: {
            settings+: {
              funlen+: {
                lines: lines,
              },
            },
          },
        },
        withStatements(statements): {
          linters+: {
            settings+: {
              funlen+: {
                statements: statements,
              },
            },
          },
        },
      },
      ginkgolinter: {
        withAllowHavelenZero(allowHavelenZero): {
          linters+: {
            settings+: {
              ginkgolinter+: {
                'allow-havelen-zero': allowHavelenZero,
              },
            },
          },
        },
        withForbidFocusContainer(forbidFocusContainer): {
          linters+: {
            settings+: {
              ginkgolinter+: {
                'forbid-focus-container': forbidFocusContainer,
              },
            },
          },
        },
        withForbidSpecPollution(forbidSpecPollution): {
          linters+: {
            settings+: {
              ginkgolinter+: {
                'forbid-spec-pollution': forbidSpecPollution,
              },
            },
          },
        },
        withForceAssertionDescription(forceAssertionDescription): {
          linters+: {
            settings+: {
              ginkgolinter+: {
                'force-assertion-description': forceAssertionDescription,
              },
            },
          },
        },
        withForceExpectTo(forceExpectTo): {
          linters+: {
            settings+: {
              ginkgolinter+: {
                'force-expect-to': forceExpectTo,
              },
            },
          },
        },
        withForceSucceed(forceSucceed): {
          linters+: {
            settings+: {
              ginkgolinter+: {
                'force-succeed': forceSucceed,
              },
            },
          },
        },
        withForceTonot(forceTonot): {
          linters+: {
            settings+: {
              ginkgolinter+: {
                'force-tonot': forceTonot,
              },
            },
          },
        },
        withSuppressAsyncAssertion(suppressAsyncAssertion): {
          linters+: {
            settings+: {
              ginkgolinter+: {
                'suppress-async-assertion': suppressAsyncAssertion,
              },
            },
          },
        },
        withSuppressCompareAssertion(suppressCompareAssertion): {
          linters+: {
            settings+: {
              ginkgolinter+: {
                'suppress-compare-assertion': suppressCompareAssertion,
              },
            },
          },
        },
        withSuppressErrAssertion(suppressErrAssertion): {
          linters+: {
            settings+: {
              ginkgolinter+: {
                'suppress-err-assertion': suppressErrAssertion,
              },
            },
          },
        },
        withSuppressLenAssertion(suppressLenAssertion): {
          linters+: {
            settings+: {
              ginkgolinter+: {
                'suppress-len-assertion': suppressLenAssertion,
              },
            },
          },
        },
        withSuppressNilAssertion(suppressNilAssertion): {
          linters+: {
            settings+: {
              ginkgolinter+: {
                'suppress-nil-assertion': suppressNilAssertion,
              },
            },
          },
        },
        withSuppressTypeCompareAssertion(suppressTypeCompareAssertion): {
          linters+: {
            settings+: {
              ginkgolinter+: {
                'suppress-type-compare-assertion': suppressTypeCompareAssertion,
              },
            },
          },
        },
        withValidateAsyncIntervals(validateAsyncIntervals): {
          linters+: {
            settings+: {
              ginkgolinter+: {
                'validate-async-intervals': validateAsyncIntervals,
              },
            },
          },
        },
      },
      gochecksumtype: {
        withDefaultSignifiesExhaustive(defaultSignifiesExhaustive): {
          linters+: {
            settings+: {
              gochecksumtype+: {
                'default-signifies-exhaustive': defaultSignifiesExhaustive,
              },
            },
          },
        },
        withIncludeSharedInterfaces(includeSharedInterfaces): {
          linters+: {
            settings+: {
              gochecksumtype+: {
                'include-shared-interfaces': includeSharedInterfaces,
              },
            },
          },
        },
      },
      gocognit: {
        withMinComplexity(minComplexity): {
          linters+: {
            settings+: {
              gocognit+: {
                'min-complexity': minComplexity,
              },
            },
          },
        },
      },
      goconst: {
        withEvalConstExpressions(evalConstExpressions): {
          linters+: {
            settings+: {
              goconst+: {
                'eval-const-expressions': evalConstExpressions,
              },
            },
          },
        },
        withFindDuplicates(findDuplicates): {
          linters+: {
            settings+: {
              goconst+: {
                'find-duplicates': findDuplicates,
              },
            },
          },
        },
        withIgnoreCalls(ignoreCalls): {
          linters+: {
            settings+: {
              goconst+: {
                'ignore-calls': ignoreCalls,
              },
            },
          },
        },
        withIgnoreFunctions(ignoreFunctions): {
          linters+: {
            settings+: {
              goconst+: {
                'ignore-functions': if std.isArray(v=ignoreFunctions) then ignoreFunctions else [ignoreFunctions],
              },
            },
          },
        },
        withIgnoreFunctionsMixin(ignoreFunctions): {
          linters+: {
            settings+: {
              goconst+: {
                'ignore-functions'+: if std.isArray(v=ignoreFunctions) then ignoreFunctions else [ignoreFunctions],
              },
            },
          },
        },
        withIgnoreStringValues(ignoreStringValues): {
          linters+: {
            settings+: {
              goconst+: {
                'ignore-string-values': if std.isArray(v=ignoreStringValues) then ignoreStringValues else [ignoreStringValues],
              },
            },
          },
        },
        withIgnoreStringValuesMixin(ignoreStringValues): {
          linters+: {
            settings+: {
              goconst+: {
                'ignore-string-values'+: if std.isArray(v=ignoreStringValues) then ignoreStringValues else [ignoreStringValues],
              },
            },
          },
        },
        withIgnoreTests(ignoreTests): {
          linters+: {
            settings+: {
              goconst+: {
                'ignore-tests': ignoreTests,
              },
            },
          },
        },
        withMatchConstant(matchConstant): {
          linters+: {
            settings+: {
              goconst+: {
                'match-constant': matchConstant,
              },
            },
          },
        },
        withMax(max): {
          linters+: {
            settings+: {
              goconst+: {
                max: max,
              },
            },
          },
        },
        withMin(min): {
          linters+: {
            settings+: {
              goconst+: {
                min: min,
              },
            },
          },
        },
        withMinLen(minLen): {
          linters+: {
            settings+: {
              goconst+: {
                'min-len': minLen,
              },
            },
          },
        },
        withMinOccurrences(minOccurrences): {
          linters+: {
            settings+: {
              goconst+: {
                'min-occurrences': minOccurrences,
              },
            },
          },
        },
        withNumbers(numbers): {
          linters+: {
            settings+: {
              goconst+: {
                numbers: numbers,
              },
            },
          },
        },
      },
      gocritic: {
        settings: {
          captLocal: {
            withParamsOnly(paramsOnly): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      captLocal+: {
                        paramsOnly: paramsOnly,
                      },
                    },
                  },
                },
              },
            },
          },
          commentedOutCode: {
            withMinLength(minLength): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      commentedOutCode+: {
                        minLength: minLength,
                      },
                    },
                  },
                },
              },
            },
          },
          elseif: {
            withSkipBalanced(skipBalanced): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      elseif+: {
                        skipBalanced: skipBalanced,
                      },
                    },
                  },
                },
              },
            },
          },
          hugeParam: {
            withSizeThreshold(sizeThreshold): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      hugeParam+: {
                        sizeThreshold: sizeThreshold,
                      },
                    },
                  },
                },
              },
            },
          },
          ifElseChain: {
            withMinThreshold(minThreshold): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      ifElseChain+: {
                        minThreshold: minThreshold,
                      },
                    },
                  },
                },
              },
            },
          },
          nestingReduce: {
            withBodyWidth(bodyWidth): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      nestingReduce+: {
                        bodyWidth: bodyWidth,
                      },
                    },
                  },
                },
              },
            },
          },
          rangeExprCopy: {
            withSizeThreshold(sizeThreshold): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      rangeExprCopy+: {
                        sizeThreshold: sizeThreshold,
                      },
                    },
                  },
                },
              },
            },
            withSkipTestFuncs(skipTestFuncs): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      rangeExprCopy+: {
                        skipTestFuncs: skipTestFuncs,
                      },
                    },
                  },
                },
              },
            },
          },
          rangeValCopy: {
            withSizeThreshold(sizeThreshold): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      rangeValCopy+: {
                        sizeThreshold: sizeThreshold,
                      },
                    },
                  },
                },
              },
            },
            withSkipTestFuncs(skipTestFuncs): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      rangeValCopy+: {
                        skipTestFuncs: skipTestFuncs,
                      },
                    },
                  },
                },
              },
            },
          },
          ruleguard: {
            withDebug(debug): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      ruleguard+: {
                        debug: debug,
                      },
                    },
                  },
                },
              },
            },
            withDisable(disable): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      ruleguard+: {
                        disable: disable,
                      },
                    },
                  },
                },
              },
            },
            withEnable(enable): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      ruleguard+: {
                        enable: enable,
                      },
                    },
                  },
                },
              },
            },
            withFailOn(failOn): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      ruleguard+: {
                        failOn: failOn,
                      },
                    },
                  },
                },
              },
            },
            withRules(rules): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      ruleguard+: {
                        rules: rules,
                      },
                    },
                  },
                },
              },
            },
          },
          tooManyResultsChecker: {
            withMaxResults(maxResults): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      tooManyResultsChecker+: {
                        maxResults: maxResults,
                      },
                    },
                  },
                },
              },
            },
          },
          truncateCmp: {
            withSkipArchDependent(skipArchDependent): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      truncateCmp+: {
                        skipArchDependent: skipArchDependent,
                      },
                    },
                  },
                },
              },
            },
          },
          underef: {
            withSkipRecvDeref(skipRecvDeref): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      underef+: {
                        skipRecvDeref: skipRecvDeref,
                      },
                    },
                  },
                },
              },
            },
          },
          unnamedResult: {
            withCheckExported(checkExported): {
              linters+: {
                settings+: {
                  gocritic+: {
                    settings+: {
                      unnamedResult+: {
                        checkExported: checkExported,
                      },
                    },
                  },
                },
              },
            },
          },
        },
        withDisableAll(disableAll): {
          linters+: {
            settings+: {
              gocritic+: {
                'disable-all': disableAll,
              },
            },
          },
        },
        withDisabledChecks(disabledChecks): {
          linters+: {
            settings+: {
              gocritic+: {
                'disabled-checks': if std.isArray(v=disabledChecks) then disabledChecks else [disabledChecks],
              },
            },
          },
        },
        withDisabledChecksMixin(disabledChecks): {
          linters+: {
            settings+: {
              gocritic+: {
                'disabled-checks'+: if std.isArray(v=disabledChecks) then disabledChecks else [disabledChecks],
              },
            },
          },
        },
        withDisabledTags(disabledTags): {
          linters+: {
            settings+: {
              gocritic+: {
                'disabled-tags': if std.isArray(v=disabledTags) then disabledTags else [disabledTags],
              },
            },
          },
        },
        withDisabledTagsMixin(disabledTags): {
          linters+: {
            settings+: {
              gocritic+: {
                'disabled-tags'+: if std.isArray(v=disabledTags) then disabledTags else [disabledTags],
              },
            },
          },
        },
        withEnableAll(enableAll): {
          linters+: {
            settings+: {
              gocritic+: {
                'enable-all': enableAll,
              },
            },
          },
        },
        withEnabledChecks(enabledChecks): {
          linters+: {
            settings+: {
              gocritic+: {
                'enabled-checks': if std.isArray(v=enabledChecks) then enabledChecks else [enabledChecks],
              },
            },
          },
        },
        withEnabledChecksMixin(enabledChecks): {
          linters+: {
            settings+: {
              gocritic+: {
                'enabled-checks'+: if std.isArray(v=enabledChecks) then enabledChecks else [enabledChecks],
              },
            },
          },
        },
        withEnabledTags(enabledTags): {
          linters+: {
            settings+: {
              gocritic+: {
                'enabled-tags': if std.isArray(v=enabledTags) then enabledTags else [enabledTags],
              },
            },
          },
        },
        withEnabledTagsMixin(enabledTags): {
          linters+: {
            settings+: {
              gocritic+: {
                'enabled-tags'+: if std.isArray(v=enabledTags) then enabledTags else [enabledTags],
              },
            },
          },
        },
      },
      gocyclo: {
        withMinComplexity(minComplexity): {
          linters+: {
            settings+: {
              gocyclo+: {
                'min-complexity': minComplexity,
              },
            },
          },
        },
      },
      godoclint: {
        options: {
          maxLen: {
            withLength(length): {
              linters+: {
                settings+: {
                  godoclint+: {
                    options+: {
                      'max-len'+: {
                        length: length,
                      },
                    },
                  },
                },
              },
            },
          },
          requireDoc: {
            withIgnoreExported(ignoreExported): {
              linters+: {
                settings+: {
                  godoclint+: {
                    options+: {
                      'require-doc'+: {
                        'ignore-exported': ignoreExported,
                      },
                    },
                  },
                },
              },
            },
            withIgnoreUnexported(ignoreUnexported): {
              linters+: {
                settings+: {
                  godoclint+: {
                    options+: {
                      'require-doc'+: {
                        'ignore-unexported': ignoreUnexported,
                      },
                    },
                  },
                },
              },
            },
          },
          startWithName: {
            withIncludeUnexported(includeUnexported): {
              linters+: {
                settings+: {
                  godoclint+: {
                    options+: {
                      'start-with-name'+: {
                        'include-unexported': includeUnexported,
                      },
                    },
                  },
                },
              },
            },
          },
        },
        withDefault(default): {
          linters+: {
            settings+: {
              godoclint+: {
                default: default,
              },
            },
          },
        },
        withDisable(disable): {
          linters+: {
            settings+: {
              godoclint+: {
                disable: if std.isArray(v=disable) then disable else [disable],
              },
            },
          },
        },
        withDisableMixin(disable): {
          linters+: {
            settings+: {
              godoclint+: {
                disable+: if std.isArray(v=disable) then disable else [disable],
              },
            },
          },
        },
        withEnable(enable): {
          linters+: {
            settings+: {
              godoclint+: {
                enable: if std.isArray(v=enable) then enable else [enable],
              },
            },
          },
        },
        withEnableMixin(enable): {
          linters+: {
            settings+: {
              godoclint+: {
                enable+: if std.isArray(v=enable) then enable else [enable],
              },
            },
          },
        },
      },
      godot: {
        withCapital(capital): {
          linters+: {
            settings+: {
              godot+: {
                capital: capital,
              },
            },
          },
        },
        withCheckAll(checkAll): {
          linters+: {
            settings+: {
              godot+: {
                'check-all': checkAll,
              },
            },
          },
        },
        withExclude(exclude): {
          linters+: {
            settings+: {
              godot+: {
                exclude: if std.isArray(v=exclude) then exclude else [exclude],
              },
            },
          },
        },
        withExcludeMixin(exclude): {
          linters+: {
            settings+: {
              godot+: {
                exclude+: if std.isArray(v=exclude) then exclude else [exclude],
              },
            },
          },
        },
        withPeriod(period): {
          linters+: {
            settings+: {
              godot+: {
                period: period,
              },
            },
          },
        },
        withScope(scope): {
          linters+: {
            settings+: {
              godot+: {
                scope: scope,
              },
            },
          },
        },
      },
      godox: {
        withKeywords(keywords): {
          linters+: {
            settings+: {
              godox+: {
                keywords: if std.isArray(v=keywords) then keywords else [keywords],
              },
            },
          },
        },
        withKeywordsMixin(keywords): {
          linters+: {
            settings+: {
              godox+: {
                keywords+: if std.isArray(v=keywords) then keywords else [keywords],
              },
            },
          },
        },
      },
      goheader: {
        values: {
          const: {},
          regexp: {},
        },
        withTemplate(template): {
          linters+: {
            settings+: {
              goheader+: {
                template: template,
              },
            },
          },
        },
        withTemplatePath(templatePath): {
          linters+: {
            settings+: {
              goheader+: {
                'template-path': templatePath,
              },
            },
          },
        },
      },
      gomoddirectives: {
        withCheckModulePath(checkModulePath): {
          linters+: {
            settings+: {
              gomoddirectives+: {
                'check-module-path': checkModulePath,
              },
            },
          },
        },
        withExcludeForbidden(excludeForbidden): {
          linters+: {
            settings+: {
              gomoddirectives+: {
                'exclude-forbidden': excludeForbidden,
              },
            },
          },
        },
        withGoDebugForbidden(goDebugForbidden): {
          linters+: {
            settings+: {
              gomoddirectives+: {
                'go-debug-forbidden': goDebugForbidden,
              },
            },
          },
        },
        withGoVersionPattern(goVersionPattern): {
          linters+: {
            settings+: {
              gomoddirectives+: {
                'go-version-pattern': goVersionPattern,
              },
            },
          },
        },
        withIgnoreForbidden(ignoreForbidden): {
          linters+: {
            settings+: {
              gomoddirectives+: {
                'ignore-forbidden': ignoreForbidden,
              },
            },
          },
        },
        withReplaceAllowList(replaceAllowList): {
          linters+: {
            settings+: {
              gomoddirectives+: {
                'replace-allow-list': if std.isArray(v=replaceAllowList) then replaceAllowList else [replaceAllowList],
              },
            },
          },
        },
        withReplaceAllowListMixin(replaceAllowList): {
          linters+: {
            settings+: {
              gomoddirectives+: {
                'replace-allow-list'+: if std.isArray(v=replaceAllowList) then replaceAllowList else [replaceAllowList],
              },
            },
          },
        },
        withReplaceLocal(replaceLocal): {
          linters+: {
            settings+: {
              gomoddirectives+: {
                'replace-local': replaceLocal,
              },
            },
          },
        },
        withRetractAllowNoExplanation(retractAllowNoExplanation): {
          linters+: {
            settings+: {
              gomoddirectives+: {
                'retract-allow-no-explanation': retractAllowNoExplanation,
              },
            },
          },
        },
        withToolForbidden(toolForbidden): {
          linters+: {
            settings+: {
              gomoddirectives+: {
                'tool-forbidden': toolForbidden,
              },
            },
          },
        },
        withToolchainForbidden(toolchainForbidden): {
          linters+: {
            settings+: {
              gomoddirectives+: {
                'toolchain-forbidden': toolchainForbidden,
              },
            },
          },
        },
        withToolchainPattern(toolchainPattern): {
          linters+: {
            settings+: {
              gomoddirectives+: {
                'toolchain-pattern': toolchainPattern,
              },
            },
          },
        },
      },
      gomodguard: {
        allowed: {
          withDomains(domains): {
            linters+: {
              settings+: {
                gomodguard+: {
                  allowed+: {
                    domains: if std.isArray(v=domains) then domains else [domains],
                  },
                },
              },
            },
          },
          withDomainsMixin(domains): {
            linters+: {
              settings+: {
                gomodguard+: {
                  allowed+: {
                    domains+: if std.isArray(v=domains) then domains else [domains],
                  },
                },
              },
            },
          },
          withModules(modules): {
            linters+: {
              settings+: {
                gomodguard+: {
                  allowed+: {
                    modules: if std.isArray(v=modules) then modules else [modules],
                  },
                },
              },
            },
          },
          withModulesMixin(modules): {
            linters+: {
              settings+: {
                gomodguard+: {
                  allowed+: {
                    modules+: if std.isArray(v=modules) then modules else [modules],
                  },
                },
              },
            },
          },
        },
        blocked: {
          withLocalReplaceDirectives(localReplaceDirectives): {
            linters+: {
              settings+: {
                gomodguard+: {
                  blocked+: {
                    'local-replace-directives': localReplaceDirectives,
                  },
                },
              },
            },
          },
          withModules(modules): {
            linters+: {
              settings+: {
                gomodguard+: {
                  blocked+: {
                    modules: if std.isArray(v=modules) then modules else [modules],
                  },
                },
              },
            },
          },
          withModulesMixin(modules): {
            linters+: {
              settings+: {
                gomodguard+: {
                  blocked+: {
                    modules+: if std.isArray(v=modules) then modules else [modules],
                  },
                },
              },
            },
          },
          withVersions(versions): {
            linters+: {
              settings+: {
                gomodguard+: {
                  blocked+: {
                    versions: if std.isArray(v=versions) then versions else [versions],
                  },
                },
              },
            },
          },
          withVersionsMixin(versions): {
            linters+: {
              settings+: {
                gomodguard+: {
                  blocked+: {
                    versions+: if std.isArray(v=versions) then versions else [versions],
                  },
                },
              },
            },
          },
        },
      },
      gomodguardV2: {
        withAllowed(allowed): {
          linters+: {
            settings+: {
              gomodguard_v2+: {
                allowed: if std.isArray(v=allowed) then allowed else [allowed],
              },
            },
          },
        },
        withAllowedMixin(allowed): {
          linters+: {
            settings+: {
              gomodguard_v2+: {
                allowed+: if std.isArray(v=allowed) then allowed else [allowed],
              },
            },
          },
        },
        withBlocked(blocked): {
          linters+: {
            settings+: {
              gomodguard_v2+: {
                blocked: if std.isArray(v=blocked) then blocked else [blocked],
              },
            },
          },
        },
        withBlockedMixin(blocked): {
          linters+: {
            settings+: {
              gomodguard_v2+: {
                blocked+: if std.isArray(v=blocked) then blocked else [blocked],
              },
            },
          },
        },
        withLocalReplaceDirectives(localReplaceDirectives): {
          linters+: {
            settings+: {
              gomodguard_v2+: {
                'local-replace-directives': localReplaceDirectives,
              },
            },
          },
        },
      },
      gosec: {
        config: {},
        withConcurrency(concurrency): {
          linters+: {
            settings+: {
              gosec+: {
                concurrency: concurrency,
              },
            },
          },
        },
        withConfidence(confidence): {
          linters+: {
            settings+: {
              gosec+: {
                confidence: confidence,
              },
            },
          },
        },
        withExcludes(excludes): {
          linters+: {
            settings+: {
              gosec+: {
                excludes: if std.isArray(v=excludes) then excludes else [excludes],
              },
            },
          },
        },
        withExcludesMixin(excludes): {
          linters+: {
            settings+: {
              gosec+: {
                excludes+: if std.isArray(v=excludes) then excludes else [excludes],
              },
            },
          },
        },
        withIncludes(includes): {
          linters+: {
            settings+: {
              gosec+: {
                includes: if std.isArray(v=includes) then includes else [includes],
              },
            },
          },
        },
        withIncludesMixin(includes): {
          linters+: {
            settings+: {
              gosec+: {
                includes+: if std.isArray(v=includes) then includes else [includes],
              },
            },
          },
        },
        withSeverity(severity): {
          linters+: {
            settings+: {
              gosec+: {
                severity: severity,
              },
            },
          },
        },
      },
      gosmopolitan: {
        withAllowTimeLocal(allowTimeLocal): {
          linters+: {
            settings+: {
              gosmopolitan+: {
                'allow-time-local': allowTimeLocal,
              },
            },
          },
        },
        withEscapeHatches(escapeHatches): {
          linters+: {
            settings+: {
              gosmopolitan+: {
                'escape-hatches': if std.isArray(v=escapeHatches) then escapeHatches else [escapeHatches],
              },
            },
          },
        },
        withEscapeHatchesMixin(escapeHatches): {
          linters+: {
            settings+: {
              gosmopolitan+: {
                'escape-hatches'+: if std.isArray(v=escapeHatches) then escapeHatches else [escapeHatches],
              },
            },
          },
        },
        withWatchForScripts(watchForScripts): {
          linters+: {
            settings+: {
              gosmopolitan+: {
                'watch-for-scripts': if std.isArray(v=watchForScripts) then watchForScripts else [watchForScripts],
              },
            },
          },
        },
        withWatchForScriptsMixin(watchForScripts): {
          linters+: {
            settings+: {
              gosmopolitan+: {
                'watch-for-scripts'+: if std.isArray(v=watchForScripts) then watchForScripts else [watchForScripts],
              },
            },
          },
        },
      },
      govet: {
        settings: {},
        withDisable(disable): {
          linters+: {
            settings+: {
              govet+: {
                disable: if std.isArray(v=disable) then disable else [disable],
              },
            },
          },
        },
        withDisableAll(disableAll): {
          linters+: {
            settings+: {
              govet+: {
                'disable-all': disableAll,
              },
            },
          },
        },
        withDisableMixin(disable): {
          linters+: {
            settings+: {
              govet+: {
                disable+: if std.isArray(v=disable) then disable else [disable],
              },
            },
          },
        },
        withEnable(enable): {
          linters+: {
            settings+: {
              govet+: {
                enable: if std.isArray(v=enable) then enable else [enable],
              },
            },
          },
        },
        withEnableAll(enableAll): {
          linters+: {
            settings+: {
              govet+: {
                'enable-all': enableAll,
              },
            },
          },
        },
        withEnableMixin(enable): {
          linters+: {
            settings+: {
              govet+: {
                enable+: if std.isArray(v=enable) then enable else [enable],
              },
            },
          },
        },
      },
      grouper: {
        withConstRequireGrouping(constRequireGrouping): {
          linters+: {
            settings+: {
              grouper+: {
                'const-require-grouping': constRequireGrouping,
              },
            },
          },
        },
        withConstRequireSingleConst(constRequireSingleConst): {
          linters+: {
            settings+: {
              grouper+: {
                'const-require-single-const': constRequireSingleConst,
              },
            },
          },
        },
        withImportRequireGrouping(importRequireGrouping): {
          linters+: {
            settings+: {
              grouper+: {
                'import-require-grouping': importRequireGrouping,
              },
            },
          },
        },
        withImportRequireSingleImport(importRequireSingleImport): {
          linters+: {
            settings+: {
              grouper+: {
                'import-require-single-import': importRequireSingleImport,
              },
            },
          },
        },
        withTypeRequireGrouping(typeRequireGrouping): {
          linters+: {
            settings+: {
              grouper+: {
                'type-require-grouping': typeRequireGrouping,
              },
            },
          },
        },
        withTypeRequireSingleType(typeRequireSingleType): {
          linters+: {
            settings+: {
              grouper+: {
                'type-require-single-type': typeRequireSingleType,
              },
            },
          },
        },
        withVarRequireGrouping(varRequireGrouping): {
          linters+: {
            settings+: {
              grouper+: {
                'var-require-grouping': varRequireGrouping,
              },
            },
          },
        },
        withVarRequireSingleVar(varRequireSingleVar): {
          linters+: {
            settings+: {
              grouper+: {
                'var-require-single-var': varRequireSingleVar,
              },
            },
          },
        },
      },
      iface: {
        settings: {
          unused: {
            withExclude(exclude): {
              linters+: {
                settings+: {
                  iface+: {
                    settings+: {
                      unused+: {
                        exclude: if std.isArray(v=exclude) then exclude else [exclude],
                      },
                    },
                  },
                },
              },
            },
            withExcludeMixin(exclude): {
              linters+: {
                settings+: {
                  iface+: {
                    settings+: {
                      unused+: {
                        exclude+: if std.isArray(v=exclude) then exclude else [exclude],
                      },
                    },
                  },
                },
              },
            },
          },
        },
        withEnable(enable): {
          linters+: {
            settings+: {
              iface+: {
                enable: if std.isArray(v=enable) then enable else [enable],
              },
            },
          },
        },
        withEnableMixin(enable): {
          linters+: {
            settings+: {
              iface+: {
                enable+: if std.isArray(v=enable) then enable else [enable],
              },
            },
          },
        },
      },
      importas: {
        withAlias(alias): {
          linters+: {
            settings+: {
              importas+: {
                alias: if std.isArray(v=alias) then alias else [alias],
              },
            },
          },
        },
        withAliasMixin(alias): {
          linters+: {
            settings+: {
              importas+: {
                alias+: if std.isArray(v=alias) then alias else [alias],
              },
            },
          },
        },
        withNoExtraAliases(noExtraAliases): {
          linters+: {
            settings+: {
              importas+: {
                'no-extra-aliases': noExtraAliases,
              },
            },
          },
        },
        withNoUnaliased(noUnaliased): {
          linters+: {
            settings+: {
              importas+: {
                'no-unaliased': noUnaliased,
              },
            },
          },
        },
      },
      inamedparam: {
        withSkipSingleParam(skipSingleParam): {
          linters+: {
            settings+: {
              inamedparam+: {
                'skip-single-param': skipSingleParam,
              },
            },
          },
        },
      },
      ineffassign: {
        withCheckEscapingErrors(checkEscapingErrors): {
          linters+: {
            settings+: {
              ineffassign+: {
                'check-escaping-errors': checkEscapingErrors,
              },
            },
          },
        },
      },
      interfacebloat: {
        withMax(max): {
          linters+: {
            settings+: {
              interfacebloat+: {
                max: max,
              },
            },
          },
        },
      },
      iotamixing: {
        withReportIndividual(reportIndividual): {
          linters+: {
            settings+: {
              iotamixing+: {
                'report-individual': reportIndividual,
              },
            },
          },
        },
      },
      ireturn: {
        withAllow(allow): {
          linters+: {
            settings+: {
              ireturn+: {
                allow: if std.isArray(v=allow) then allow else [allow],
              },
            },
          },
        },
        withAllowMixin(allow): {
          linters+: {
            settings+: {
              ireturn+: {
                allow+: if std.isArray(v=allow) then allow else [allow],
              },
            },
          },
        },
        withReject(reject): {
          linters+: {
            settings+: {
              ireturn+: {
                reject: if std.isArray(v=reject) then reject else [reject],
              },
            },
          },
        },
        withRejectMixin(reject): {
          linters+: {
            settings+: {
              ireturn+: {
                reject+: if std.isArray(v=reject) then reject else [reject],
              },
            },
          },
        },
      },
      lll: {
        withLineLength(lineLength): {
          linters+: {
            settings+: {
              lll+: {
                'line-length': lineLength,
              },
            },
          },
        },
        withTabWidth(tabWidth): {
          linters+: {
            settings+: {
              lll+: {
                'tab-width': tabWidth,
              },
            },
          },
        },
      },
      loggercheck: {
        withKitlog(kitlog): {
          linters+: {
            settings+: {
              loggercheck+: {
                kitlog: kitlog,
              },
            },
          },
        },
        withKlog(klog): {
          linters+: {
            settings+: {
              loggercheck+: {
                klog: klog,
              },
            },
          },
        },
        withLogr(logr): {
          linters+: {
            settings+: {
              loggercheck+: {
                logr: logr,
              },
            },
          },
        },
        withNoPrintfLike(noPrintfLike): {
          linters+: {
            settings+: {
              loggercheck+: {
                'no-printf-like': noPrintfLike,
              },
            },
          },
        },
        withRequireStringKey(requireStringKey): {
          linters+: {
            settings+: {
              loggercheck+: {
                'require-string-key': requireStringKey,
              },
            },
          },
        },
        withRules(rules): {
          linters+: {
            settings+: {
              loggercheck+: {
                rules: if std.isArray(v=rules) then rules else [rules],
              },
            },
          },
        },
        withRulesMixin(rules): {
          linters+: {
            settings+: {
              loggercheck+: {
                rules+: if std.isArray(v=rules) then rules else [rules],
              },
            },
          },
        },
        withSlog(slog): {
          linters+: {
            settings+: {
              loggercheck+: {
                slog: slog,
              },
            },
          },
        },
        withZap(zap): {
          linters+: {
            settings+: {
              loggercheck+: {
                zap: zap,
              },
            },
          },
        },
      },
      maintidx: {
        withUnder(under): {
          linters+: {
            settings+: {
              maintidx+: {
                under: under,
              },
            },
          },
        },
      },
      makezero: {
        withAlways(always): {
          linters+: {
            settings+: {
              makezero+: {
                always: always,
              },
            },
          },
        },
      },
      misspell: {
        withExtraWords(extraWords): {
          linters+: {
            settings+: {
              misspell+: {
                'extra-words': if std.isArray(v=extraWords) then extraWords else [extraWords],
              },
            },
          },
        },
        withExtraWordsMixin(extraWords): {
          linters+: {
            settings+: {
              misspell+: {
                'extra-words'+: if std.isArray(v=extraWords) then extraWords else [extraWords],
              },
            },
          },
        },
        withIgnoreRules(ignoreRules): {
          linters+: {
            settings+: {
              misspell+: {
                'ignore-rules': if std.isArray(v=ignoreRules) then ignoreRules else [ignoreRules],
              },
            },
          },
        },
        withIgnoreRulesMixin(ignoreRules): {
          linters+: {
            settings+: {
              misspell+: {
                'ignore-rules'+: if std.isArray(v=ignoreRules) then ignoreRules else [ignoreRules],
              },
            },
          },
        },
        withLocale(locale): {
          linters+: {
            settings+: {
              misspell+: {
                locale: locale,
              },
            },
          },
        },
        withMode(mode): {
          linters+: {
            settings+: {
              misspell+: {
                mode: mode,
              },
            },
          },
        },
      },
      mnd: {
        withChecks(checks): {
          linters+: {
            settings+: {
              mnd+: {
                checks: if std.isArray(v=checks) then checks else [checks],
              },
            },
          },
        },
        withChecksMixin(checks): {
          linters+: {
            settings+: {
              mnd+: {
                checks+: if std.isArray(v=checks) then checks else [checks],
              },
            },
          },
        },
        withIgnoredFiles(ignoredFiles): {
          linters+: {
            settings+: {
              mnd+: {
                'ignored-files': if std.isArray(v=ignoredFiles) then ignoredFiles else [ignoredFiles],
              },
            },
          },
        },
        withIgnoredFilesMixin(ignoredFiles): {
          linters+: {
            settings+: {
              mnd+: {
                'ignored-files'+: if std.isArray(v=ignoredFiles) then ignoredFiles else [ignoredFiles],
              },
            },
          },
        },
        withIgnoredFunctions(ignoredFunctions): {
          linters+: {
            settings+: {
              mnd+: {
                'ignored-functions': if std.isArray(v=ignoredFunctions) then ignoredFunctions else [ignoredFunctions],
              },
            },
          },
        },
        withIgnoredFunctionsMixin(ignoredFunctions): {
          linters+: {
            settings+: {
              mnd+: {
                'ignored-functions'+: if std.isArray(v=ignoredFunctions) then ignoredFunctions else [ignoredFunctions],
              },
            },
          },
        },
        withIgnoredNumbers(ignoredNumbers): {
          linters+: {
            settings+: {
              mnd+: {
                'ignored-numbers': if std.isArray(v=ignoredNumbers) then ignoredNumbers else [ignoredNumbers],
              },
            },
          },
        },
        withIgnoredNumbersMixin(ignoredNumbers): {
          linters+: {
            settings+: {
              mnd+: {
                'ignored-numbers'+: if std.isArray(v=ignoredNumbers) then ignoredNumbers else [ignoredNumbers],
              },
            },
          },
        },
      },
      modernize: {
        withDisable(disable): {
          linters+: {
            settings+: {
              modernize+: {
                disable: if std.isArray(v=disable) then disable else [disable],
              },
            },
          },
        },
        withDisableMixin(disable): {
          linters+: {
            settings+: {
              modernize+: {
                disable+: if std.isArray(v=disable) then disable else [disable],
              },
            },
          },
        },
      },
      musttag: {
        withFunctions(functions): {
          linters+: {
            settings+: {
              musttag+: {
                functions: if std.isArray(v=functions) then functions else [functions],
              },
            },
          },
        },
        withFunctionsMixin(functions): {
          linters+: {
            settings+: {
              musttag+: {
                functions+: if std.isArray(v=functions) then functions else [functions],
              },
            },
          },
        },
      },
      nakedret: {
        withMaxFuncLines(maxFuncLines): {
          linters+: {
            settings+: {
              nakedret+: {
                'max-func-lines': maxFuncLines,
              },
            },
          },
        },
      },
      nestif: {
        withMinComplexity(minComplexity): {
          linters+: {
            settings+: {
              nestif+: {
                'min-complexity': minComplexity,
              },
            },
          },
        },
      },
      nilnil: {
        withCheckedTypes(checkedTypes): {
          linters+: {
            settings+: {
              nilnil+: {
                'checked-types': if std.isArray(v=checkedTypes) then checkedTypes else [checkedTypes],
              },
            },
          },
        },
        withCheckedTypesMixin(checkedTypes): {
          linters+: {
            settings+: {
              nilnil+: {
                'checked-types'+: if std.isArray(v=checkedTypes) then checkedTypes else [checkedTypes],
              },
            },
          },
        },
        withDetectOpposite(detectOpposite): {
          linters+: {
            settings+: {
              nilnil+: {
                'detect-opposite': detectOpposite,
              },
            },
          },
        },
        withOnlyTwo(onlyTwo): {
          linters+: {
            settings+: {
              nilnil+: {
                'only-two': onlyTwo,
              },
            },
          },
        },
      },
      nlreturn: {
        withBlockSize(blockSize): {
          linters+: {
            settings+: {
              nlreturn+: {
                'block-size': blockSize,
              },
            },
          },
        },
      },
      nolintlint: {
        withAllowNoExplanation(allowNoExplanation): {
          linters+: {
            settings+: {
              nolintlint+: {
                'allow-no-explanation': if std.isArray(v=allowNoExplanation) then allowNoExplanation else [allowNoExplanation],
              },
            },
          },
        },
        withAllowNoExplanationMixin(allowNoExplanation): {
          linters+: {
            settings+: {
              nolintlint+: {
                'allow-no-explanation'+: if std.isArray(v=allowNoExplanation) then allowNoExplanation else [allowNoExplanation],
              },
            },
          },
        },
        withAllowUnused(allowUnused): {
          linters+: {
            settings+: {
              nolintlint+: {
                'allow-unused': allowUnused,
              },
            },
          },
        },
        withRequireExplanation(requireExplanation): {
          linters+: {
            settings+: {
              nolintlint+: {
                'require-explanation': requireExplanation,
              },
            },
          },
        },
        withRequireSpecific(requireSpecific): {
          linters+: {
            settings+: {
              nolintlint+: {
                'require-specific': requireSpecific,
              },
            },
          },
        },
      },
      nonamedreturns: {
        withReportErrorInDefer(reportErrorInDefer): {
          linters+: {
            settings+: {
              nonamedreturns+: {
                'report-error-in-defer': reportErrorInDefer,
              },
            },
          },
        },
      },
      paralleltest: {
        withCheckCleanup(checkCleanup): {
          linters+: {
            settings+: {
              paralleltest+: {
                'check-cleanup': checkCleanup,
              },
            },
          },
        },
        withIgnoreMissing(ignoreMissing): {
          linters+: {
            settings+: {
              paralleltest+: {
                'ignore-missing': ignoreMissing,
              },
            },
          },
        },
        withIgnoreMissingSubtests(ignoreMissingSubtests): {
          linters+: {
            settings+: {
              paralleltest+: {
                'ignore-missing-subtests': ignoreMissingSubtests,
              },
            },
          },
        },
      },
      perfsprint: {
        withBoolFormat(boolFormat): {
          linters+: {
            settings+: {
              perfsprint+: {
                'bool-format': boolFormat,
              },
            },
          },
        },
        withConcatLoop(concatLoop): {
          linters+: {
            settings+: {
              perfsprint+: {
                'concat-loop': concatLoop,
              },
            },
          },
        },
        withErrError(errError): {
          linters+: {
            settings+: {
              perfsprint+: {
                'err-error': errError,
              },
            },
          },
        },
        withErrorFormat(errorFormat): {
          linters+: {
            settings+: {
              perfsprint+: {
                'error-format': errorFormat,
              },
            },
          },
        },
        withErrorf(errorf): {
          linters+: {
            settings+: {
              perfsprint+: {
                errorf: errorf,
              },
            },
          },
        },
        withHexFormat(hexFormat): {
          linters+: {
            settings+: {
              perfsprint+: {
                'hex-format': hexFormat,
              },
            },
          },
        },
        withIntConversion(intConversion): {
          linters+: {
            settings+: {
              perfsprint+: {
                'int-conversion': intConversion,
              },
            },
          },
        },
        withIntegerFormat(integerFormat): {
          linters+: {
            settings+: {
              perfsprint+: {
                'integer-format': integerFormat,
              },
            },
          },
        },
        withLoopOtherOps(loopOtherOps): {
          linters+: {
            settings+: {
              perfsprint+: {
                'loop-other-ops': loopOtherOps,
              },
            },
          },
        },
        withSprintf1(sprintf1): {
          linters+: {
            settings+: {
              perfsprint+: {
                sprintf1: sprintf1,
              },
            },
          },
        },
        withStrconcat(strconcat): {
          linters+: {
            settings+: {
              perfsprint+: {
                strconcat: strconcat,
              },
            },
          },
        },
        withStringFormat(stringFormat): {
          linters+: {
            settings+: {
              perfsprint+: {
                'string-format': stringFormat,
              },
            },
          },
        },
      },
      prealloc: {
        withForLoops(forLoops): {
          linters+: {
            settings+: {
              prealloc+: {
                'for-loops': forLoops,
              },
            },
          },
        },
        withRangeLoops(rangeLoops): {
          linters+: {
            settings+: {
              prealloc+: {
                'range-loops': rangeLoops,
              },
            },
          },
        },
        withSimple(simple): {
          linters+: {
            settings+: {
              prealloc+: {
                simple: simple,
              },
            },
          },
        },
      },
      predeclared: {
        withIgnore(ignore): {
          linters+: {
            settings+: {
              predeclared+: {
                ignore: if std.isArray(v=ignore) then ignore else [ignore],
              },
            },
          },
        },
        withIgnoreMixin(ignore): {
          linters+: {
            settings+: {
              predeclared+: {
                ignore+: if std.isArray(v=ignore) then ignore else [ignore],
              },
            },
          },
        },
        withQualifiedName(qualifiedName): {
          linters+: {
            settings+: {
              predeclared+: {
                'qualified-name': qualifiedName,
              },
            },
          },
        },
      },
      promlinter: {
        withDisabledLinters(disabledLinters): {
          linters+: {
            settings+: {
              promlinter+: {
                'disabled-linters': if std.isArray(v=disabledLinters) then disabledLinters else [disabledLinters],
              },
            },
          },
        },
        withDisabledLintersMixin(disabledLinters): {
          linters+: {
            settings+: {
              promlinter+: {
                'disabled-linters'+: if std.isArray(v=disabledLinters) then disabledLinters else [disabledLinters],
              },
            },
          },
        },
        withStrict(strict): {
          linters+: {
            settings+: {
              promlinter+: {
                strict: strict,
              },
            },
          },
        },
      },
      protogetter: {
        withReplaceFirstArgInAppend(replaceFirstArgInAppend): {
          linters+: {
            settings+: {
              protogetter+: {
                'replace-first-arg-in-append': replaceFirstArgInAppend,
              },
            },
          },
        },
        withSkipAnyGenerated(skipAnyGenerated): {
          linters+: {
            settings+: {
              protogetter+: {
                'skip-any-generated': skipAnyGenerated,
              },
            },
          },
        },
        withSkipFiles(skipFiles): {
          linters+: {
            settings+: {
              protogetter+: {
                'skip-files': if std.isArray(v=skipFiles) then skipFiles else [skipFiles],
              },
            },
          },
        },
        withSkipFilesMixin(skipFiles): {
          linters+: {
            settings+: {
              protogetter+: {
                'skip-files'+: if std.isArray(v=skipFiles) then skipFiles else [skipFiles],
              },
            },
          },
        },
        withSkipGeneratedBy(skipGeneratedBy): {
          linters+: {
            settings+: {
              protogetter+: {
                'skip-generated-by': if std.isArray(v=skipGeneratedBy) then skipGeneratedBy else [skipGeneratedBy],
              },
            },
          },
        },
        withSkipGeneratedByMixin(skipGeneratedBy): {
          linters+: {
            settings+: {
              protogetter+: {
                'skip-generated-by'+: if std.isArray(v=skipGeneratedBy) then skipGeneratedBy else [skipGeneratedBy],
              },
            },
          },
        },
      },
      reassign: {
        withPatterns(patterns): {
          linters+: {
            settings+: {
              reassign+: {
                patterns: if std.isArray(v=patterns) then patterns else [patterns],
              },
            },
          },
        },
        withPatternsMixin(patterns): {
          linters+: {
            settings+: {
              reassign+: {
                patterns+: if std.isArray(v=patterns) then patterns else [patterns],
              },
            },
          },
        },
      },
      recvcheck: {
        withDisableBuiltin(disableBuiltin): {
          linters+: {
            settings+: {
              recvcheck+: {
                'disable-builtin': disableBuiltin,
              },
            },
          },
        },
        withExclusions(exclusions): {
          linters+: {
            settings+: {
              recvcheck+: {
                exclusions: if std.isArray(v=exclusions) then exclusions else [exclusions],
              },
            },
          },
        },
        withExclusionsMixin(exclusions): {
          linters+: {
            settings+: {
              recvcheck+: {
                exclusions+: if std.isArray(v=exclusions) then exclusions else [exclusions],
              },
            },
          },
        },
      },
      revive: {
        withConfidence(confidence): {
          linters+: {
            settings+: {
              revive+: {
                confidence: confidence,
              },
            },
          },
        },
        withDirectives(directives): {
          linters+: {
            settings+: {
              revive+: {
                directives: if std.isArray(v=directives) then directives else [directives],
              },
            },
          },
        },
        withDirectivesMixin(directives): {
          linters+: {
            settings+: {
              revive+: {
                directives+: if std.isArray(v=directives) then directives else [directives],
              },
            },
          },
        },
        withEnableAllRules(enableAllRules): {
          linters+: {
            settings+: {
              revive+: {
                'enable-all-rules': enableAllRules,
              },
            },
          },
        },
        withEnableDefaultRules(enableDefaultRules): {
          linters+: {
            settings+: {
              revive+: {
                'enable-default-rules': enableDefaultRules,
              },
            },
          },
        },
        withMaxOpenFiles(maxOpenFiles): {
          linters+: {
            settings+: {
              revive+: {
                'max-open-files': maxOpenFiles,
              },
            },
          },
        },
        withRules(rules): {
          linters+: {
            settings+: {
              revive+: {
                rules: if std.isArray(v=rules) then rules else [rules],
              },
            },
          },
        },
        withRulesMixin(rules): {
          linters+: {
            settings+: {
              revive+: {
                rules+: if std.isArray(v=rules) then rules else [rules],
              },
            },
          },
        },
        withSeverity(severity): {
          linters+: {
            settings+: {
              revive+: {
                severity: severity,
              },
            },
          },
        },
      },
      rowserrcheck: {
        withPackages(packages): {
          linters+: {
            settings+: {
              rowserrcheck+: {
                packages: if std.isArray(v=packages) then packages else [packages],
              },
            },
          },
        },
        withPackagesMixin(packages): {
          linters+: {
            settings+: {
              rowserrcheck+: {
                packages+: if std.isArray(v=packages) then packages else [packages],
              },
            },
          },
        },
      },
      sloglint: {
        withAllowedKeys(allowedKeys): {
          linters+: {
            settings+: {
              sloglint+: {
                'allowed-keys': if std.isArray(v=allowedKeys) then allowedKeys else [allowedKeys],
              },
            },
          },
        },
        withAllowedKeysMixin(allowedKeys): {
          linters+: {
            settings+: {
              sloglint+: {
                'allowed-keys'+: if std.isArray(v=allowedKeys) then allowedKeys else [allowedKeys],
              },
            },
          },
        },
        withArgsOnSepLines(argsOnSepLines): {
          linters+: {
            settings+: {
              sloglint+: {
                'args-on-sep-lines': argsOnSepLines,
              },
            },
          },
        },
        withAttrOnly(attrOnly): {
          linters+: {
            settings+: {
              sloglint+: {
                'attr-only': attrOnly,
              },
            },
          },
        },
        withContext(context): {
          linters+: {
            settings+: {
              sloglint+: {
                context: context,
              },
            },
          },
        },
        withCustomFuncs(customFuncs): {
          linters+: {
            settings+: {
              sloglint+: {
                'custom-funcs': if std.isArray(v=customFuncs) then customFuncs else [customFuncs],
              },
            },
          },
        },
        withCustomFuncsMixin(customFuncs): {
          linters+: {
            settings+: {
              sloglint+: {
                'custom-funcs'+: if std.isArray(v=customFuncs) then customFuncs else [customFuncs],
              },
            },
          },
        },
        withForbiddenKeys(forbiddenKeys): {
          linters+: {
            settings+: {
              sloglint+: {
                'forbidden-keys': if std.isArray(v=forbiddenKeys) then forbiddenKeys else [forbiddenKeys],
              },
            },
          },
        },
        withForbiddenKeysMixin(forbiddenKeys): {
          linters+: {
            settings+: {
              sloglint+: {
                'forbidden-keys'+: if std.isArray(v=forbiddenKeys) then forbiddenKeys else [forbiddenKeys],
              },
            },
          },
        },
        withKeyNamingCase(keyNamingCase): {
          linters+: {
            settings+: {
              sloglint+: {
                'key-naming-case': keyNamingCase,
              },
            },
          },
        },
        withKvOnly(kvOnly): {
          linters+: {
            settings+: {
              sloglint+: {
                'kv-only': kvOnly,
              },
            },
          },
        },
        withMsgStyle(msgStyle): {
          linters+: {
            settings+: {
              sloglint+: {
                'msg-style': msgStyle,
              },
            },
          },
        },
        withNoGlobal(noGlobal): {
          linters+: {
            settings+: {
              sloglint+: {
                'no-global': noGlobal,
              },
            },
          },
        },
        withNoMixedArgs(noMixedArgs): {
          linters+: {
            settings+: {
              sloglint+: {
                'no-mixed-args': noMixedArgs,
              },
            },
          },
        },
        withNoRawKeys(noRawKeys): {
          linters+: {
            settings+: {
              sloglint+: {
                'no-raw-keys': noRawKeys,
              },
            },
          },
        },
        withStaticMsg(staticMsg): {
          linters+: {
            settings+: {
              sloglint+: {
                'static-msg': staticMsg,
              },
            },
          },
        },
      },
      spancheck: {
        withChecks(checks): {
          linters+: {
            settings+: {
              spancheck+: {
                checks: if std.isArray(v=checks) then checks else [checks],
              },
            },
          },
        },
        withChecksMixin(checks): {
          linters+: {
            settings+: {
              spancheck+: {
                checks+: if std.isArray(v=checks) then checks else [checks],
              },
            },
          },
        },
        withExtraStartSpanSignatures(extraStartSpanSignatures): {
          linters+: {
            settings+: {
              spancheck+: {
                'extra-start-span-signatures': if std.isArray(v=extraStartSpanSignatures) then extraStartSpanSignatures else [extraStartSpanSignatures],
              },
            },
          },
        },
        withExtraStartSpanSignaturesMixin(extraStartSpanSignatures): {
          linters+: {
            settings+: {
              spancheck+: {
                'extra-start-span-signatures'+: if std.isArray(v=extraStartSpanSignatures) then extraStartSpanSignatures else [extraStartSpanSignatures],
              },
            },
          },
        },
        withIgnoreCheckSignatures(ignoreCheckSignatures): {
          linters+: {
            settings+: {
              spancheck+: {
                'ignore-check-signatures': if std.isArray(v=ignoreCheckSignatures) then ignoreCheckSignatures else [ignoreCheckSignatures],
              },
            },
          },
        },
        withIgnoreCheckSignaturesMixin(ignoreCheckSignatures): {
          linters+: {
            settings+: {
              spancheck+: {
                'ignore-check-signatures'+: if std.isArray(v=ignoreCheckSignatures) then ignoreCheckSignatures else [ignoreCheckSignatures],
              },
            },
          },
        },
      },
      staticcheck: {
        withChecks(checks): {
          linters+: {
            settings+: {
              staticcheck+: {
                checks: if std.isArray(v=checks) then checks else [checks],
              },
            },
          },
        },
        withChecksMixin(checks): {
          linters+: {
            settings+: {
              staticcheck+: {
                checks+: if std.isArray(v=checks) then checks else [checks],
              },
            },
          },
        },
        withDotImportWhitelist(dotImportWhitelist): {
          linters+: {
            settings+: {
              staticcheck+: {
                'dot-import-whitelist': if std.isArray(v=dotImportWhitelist) then dotImportWhitelist else [dotImportWhitelist],
              },
            },
          },
        },
        withDotImportWhitelistMixin(dotImportWhitelist): {
          linters+: {
            settings+: {
              staticcheck+: {
                'dot-import-whitelist'+: if std.isArray(v=dotImportWhitelist) then dotImportWhitelist else [dotImportWhitelist],
              },
            },
          },
        },
        withHttpStatusCodeWhitelist(httpStatusCodeWhitelist): {
          linters+: {
            settings+: {
              staticcheck+: {
                'http-status-code-whitelist': if std.isArray(v=httpStatusCodeWhitelist) then httpStatusCodeWhitelist else [httpStatusCodeWhitelist],
              },
            },
          },
        },
        withHttpStatusCodeWhitelistMixin(httpStatusCodeWhitelist): {
          linters+: {
            settings+: {
              staticcheck+: {
                'http-status-code-whitelist'+: if std.isArray(v=httpStatusCodeWhitelist) then httpStatusCodeWhitelist else [httpStatusCodeWhitelist],
              },
            },
          },
        },
        withInitialisms(initialisms): {
          linters+: {
            settings+: {
              staticcheck+: {
                initialisms: if std.isArray(v=initialisms) then initialisms else [initialisms],
              },
            },
          },
        },
        withInitialismsMixin(initialisms): {
          linters+: {
            settings+: {
              staticcheck+: {
                initialisms+: if std.isArray(v=initialisms) then initialisms else [initialisms],
              },
            },
          },
        },
      },
      tagalign: {
        withAlign(align): {
          linters+: {
            settings+: {
              tagalign+: {
                align: align,
              },
            },
          },
        },
        withOrder(order): {
          linters+: {
            settings+: {
              tagalign+: {
                order: if std.isArray(v=order) then order else [order],
              },
            },
          },
        },
        withOrderMixin(order): {
          linters+: {
            settings+: {
              tagalign+: {
                order+: if std.isArray(v=order) then order else [order],
              },
            },
          },
        },
        withSort(sort): {
          linters+: {
            settings+: {
              tagalign+: {
                sort: sort,
              },
            },
          },
        },
        withStrict(strict): {
          linters+: {
            settings+: {
              tagalign+: {
                strict: strict,
              },
            },
          },
        },
      },
      tagliatelle: {
        case: {
          extendedRules: {},
          rules: {},
          withIgnoredFields(ignoredFields): {
            linters+: {
              settings+: {
                tagliatelle+: {
                  case+: {
                    'ignored-fields': if std.isArray(v=ignoredFields) then ignoredFields else [ignoredFields],
                  },
                },
              },
            },
          },
          withIgnoredFieldsMixin(ignoredFields): {
            linters+: {
              settings+: {
                tagliatelle+: {
                  case+: {
                    'ignored-fields'+: if std.isArray(v=ignoredFields) then ignoredFields else [ignoredFields],
                  },
                },
              },
            },
          },
          withOverrides(overrides): {
            linters+: {
              settings+: {
                tagliatelle+: {
                  case+: {
                    overrides: if std.isArray(v=overrides) then overrides else [overrides],
                  },
                },
              },
            },
          },
          withOverridesMixin(overrides): {
            linters+: {
              settings+: {
                tagliatelle+: {
                  case+: {
                    overrides+: if std.isArray(v=overrides) then overrides else [overrides],
                  },
                },
              },
            },
          },
          withUseFieldName(useFieldName): {
            linters+: {
              settings+: {
                tagliatelle+: {
                  case+: {
                    'use-field-name': useFieldName,
                  },
                },
              },
            },
          },
        },
      },
      testifylint: {
        boolCompare: {
          withIgnoreCustomTypes(ignoreCustomTypes): {
            linters+: {
              settings+: {
                testifylint+: {
                  'bool-compare'+: {
                    'ignore-custom-types': ignoreCustomTypes,
                  },
                },
              },
            },
          },
        },
        expectedActual: {
          withPattern(pattern): {
            linters+: {
              settings+: {
                testifylint+: {
                  'expected-actual'+: {
                    pattern: pattern,
                  },
                },
              },
            },
          },
        },
        formatter: {
          withCheckFormatString(checkFormatString): {
            linters+: {
              settings+: {
                testifylint+: {
                  formatter+: {
                    'check-format-string': checkFormatString,
                  },
                },
              },
            },
          },
          withRequireFFuncs(requireFFuncs): {
            linters+: {
              settings+: {
                testifylint+: {
                  formatter+: {
                    'require-f-funcs': requireFFuncs,
                  },
                },
              },
            },
          },
          withRequireStringMsg(requireStringMsg): {
            linters+: {
              settings+: {
                testifylint+: {
                  formatter+: {
                    'require-string-msg': requireStringMsg,
                  },
                },
              },
            },
          },
        },
        goRequire: {
          withIgnoreHttpHandlers(ignoreHttpHandlers): {
            linters+: {
              settings+: {
                testifylint+: {
                  'go-require'+: {
                    'ignore-http-handlers': ignoreHttpHandlers,
                  },
                },
              },
            },
          },
        },
        requireError: {
          withFnPattern(fnPattern): {
            linters+: {
              settings+: {
                testifylint+: {
                  'require-error'+: {
                    'fn-pattern': fnPattern,
                  },
                },
              },
            },
          },
        },
        suiteExtraAssertCall: {
          withMode(mode): {
            linters+: {
              settings+: {
                testifylint+: {
                  'suite-extra-assert-call'+: {
                    mode: mode,
                  },
                },
              },
            },
          },
        },
        withDisable(disable): {
          linters+: {
            settings+: {
              testifylint+: {
                disable: if std.isArray(v=disable) then disable else [disable],
              },
            },
          },
        },
        withDisableAll(disableAll): {
          linters+: {
            settings+: {
              testifylint+: {
                'disable-all': disableAll,
              },
            },
          },
        },
        withDisableMixin(disable): {
          linters+: {
            settings+: {
              testifylint+: {
                disable+: if std.isArray(v=disable) then disable else [disable],
              },
            },
          },
        },
        withEnable(enable): {
          linters+: {
            settings+: {
              testifylint+: {
                enable: if std.isArray(v=enable) then enable else [enable],
              },
            },
          },
        },
        withEnableAll(enableAll): {
          linters+: {
            settings+: {
              testifylint+: {
                'enable-all': enableAll,
              },
            },
          },
        },
        withEnableMixin(enable): {
          linters+: {
            settings+: {
              testifylint+: {
                enable+: if std.isArray(v=enable) then enable else [enable],
              },
            },
          },
        },
      },
      testpackage: {
        withAllowPackages(allowPackages): {
          linters+: {
            settings+: {
              testpackage+: {
                'allow-packages': if std.isArray(v=allowPackages) then allowPackages else [allowPackages],
              },
            },
          },
        },
        withAllowPackagesMixin(allowPackages): {
          linters+: {
            settings+: {
              testpackage+: {
                'allow-packages'+: if std.isArray(v=allowPackages) then allowPackages else [allowPackages],
              },
            },
          },
        },
        withSkipRegexp(skipRegexp): {
          linters+: {
            settings+: {
              testpackage+: {
                'skip-regexp': skipRegexp,
              },
            },
          },
        },
      },
      thelper: {
        benchmark: {
          withBegin(begin): {
            linters+: {
              settings+: {
                thelper+: {
                  benchmark+: {
                    begin: begin,
                  },
                },
              },
            },
          },
          withFirst(first): {
            linters+: {
              settings+: {
                thelper+: {
                  benchmark+: {
                    first: first,
                  },
                },
              },
            },
          },
          withName(name): {
            linters+: {
              settings+: {
                thelper+: {
                  benchmark+: {
                    name: name,
                  },
                },
              },
            },
          },
        },
        fuzz: {
          withBegin(begin): {
            linters+: {
              settings+: {
                thelper+: {
                  fuzz+: {
                    begin: begin,
                  },
                },
              },
            },
          },
          withFirst(first): {
            linters+: {
              settings+: {
                thelper+: {
                  fuzz+: {
                    first: first,
                  },
                },
              },
            },
          },
          withName(name): {
            linters+: {
              settings+: {
                thelper+: {
                  fuzz+: {
                    name: name,
                  },
                },
              },
            },
          },
        },
        tb: {
          withBegin(begin): {
            linters+: {
              settings+: {
                thelper+: {
                  tb+: {
                    begin: begin,
                  },
                },
              },
            },
          },
          withFirst(first): {
            linters+: {
              settings+: {
                thelper+: {
                  tb+: {
                    first: first,
                  },
                },
              },
            },
          },
          withName(name): {
            linters+: {
              settings+: {
                thelper+: {
                  tb+: {
                    name: name,
                  },
                },
              },
            },
          },
        },
        test: {
          withBegin(begin): {
            linters+: {
              settings+: {
                thelper+: {
                  test+: {
                    begin: begin,
                  },
                },
              },
            },
          },
          withFirst(first): {
            linters+: {
              settings+: {
                thelper+: {
                  test+: {
                    first: first,
                  },
                },
              },
            },
          },
          withName(name): {
            linters+: {
              settings+: {
                thelper+: {
                  test+: {
                    name: name,
                  },
                },
              },
            },
          },
        },
      },
      unconvert: {
        withFastMath(fastMath): {
          linters+: {
            settings+: {
              unconvert+: {
                'fast-math': fastMath,
              },
            },
          },
        },
        withSafe(safe): {
          linters+: {
            settings+: {
              unconvert+: {
                safe: safe,
              },
            },
          },
        },
      },
      unparam: {
        withCheckExported(checkExported): {
          linters+: {
            settings+: {
              unparam+: {
                'check-exported': checkExported,
              },
            },
          },
        },
      },
      unqueryvet: {
        sqlBuilders: {
          withBun(bun): {
            linters+: {
              settings+: {
                unqueryvet+: {
                  'sql-builders'+: {
                    bun: bun,
                  },
                },
              },
            },
          },
          withEnt(ent): {
            linters+: {
              settings+: {
                unqueryvet+: {
                  'sql-builders'+: {
                    ent: ent,
                  },
                },
              },
            },
          },
          withGorm(gorm): {
            linters+: {
              settings+: {
                unqueryvet+: {
                  'sql-builders'+: {
                    gorm: gorm,
                  },
                },
              },
            },
          },
          withJet(jet): {
            linters+: {
              settings+: {
                unqueryvet+: {
                  'sql-builders'+: {
                    jet: jet,
                  },
                },
              },
            },
          },
          withPgx(pgx): {
            linters+: {
              settings+: {
                unqueryvet+: {
                  'sql-builders'+: {
                    pgx: pgx,
                  },
                },
              },
            },
          },
          withSqlboiler(sqlboiler): {
            linters+: {
              settings+: {
                unqueryvet+: {
                  'sql-builders'+: {
                    sqlboiler: sqlboiler,
                  },
                },
              },
            },
          },
          withSqlx(sqlx): {
            linters+: {
              settings+: {
                unqueryvet+: {
                  'sql-builders'+: {
                    sqlx: sqlx,
                  },
                },
              },
            },
          },
          withSquirrel(squirrel): {
            linters+: {
              settings+: {
                unqueryvet+: {
                  'sql-builders'+: {
                    squirrel: squirrel,
                  },
                },
              },
            },
          },
        },
        withAllow(allow): {
          linters+: {
            settings+: {
              unqueryvet+: {
                allow: if std.isArray(v=allow) then allow else [allow],
              },
            },
          },
        },
        withAllowMixin(allow): {
          linters+: {
            settings+: {
              unqueryvet+: {
                allow+: if std.isArray(v=allow) then allow else [allow],
              },
            },
          },
        },
        withAllowedPatterns(allowedPatterns): {
          linters+: {
            settings+: {
              unqueryvet+: {
                'allowed-patterns': if std.isArray(v=allowedPatterns) then allowedPatterns else [allowedPatterns],
              },
            },
          },
        },
        withAllowedPatternsMixin(allowedPatterns): {
          linters+: {
            settings+: {
              unqueryvet+: {
                'allowed-patterns'+: if std.isArray(v=allowedPatterns) then allowedPatterns else [allowedPatterns],
              },
            },
          },
        },
        withCheckAliasedWildcard(checkAliasedWildcard): {
          linters+: {
            settings+: {
              unqueryvet+: {
                'check-aliased-wildcard': checkAliasedWildcard,
              },
            },
          },
        },
        withCheckFormatStrings(checkFormatStrings): {
          linters+: {
            settings+: {
              unqueryvet+: {
                'check-format-strings': checkFormatStrings,
              },
            },
          },
        },
        withCheckN1(checkN1): {
          linters+: {
            settings+: {
              unqueryvet+: {
                'check-n1': checkN1,
              },
            },
          },
        },
        withCheckSqlBuilders(checkSqlBuilders): {
          linters+: {
            settings+: {
              unqueryvet+: {
                'check-sql-builders': checkSqlBuilders,
              },
            },
          },
        },
        withCheckSqlInjection(checkSqlInjection): {
          linters+: {
            settings+: {
              unqueryvet+: {
                'check-sql-injection': checkSqlInjection,
              },
            },
          },
        },
        withCheckStringBuilder(checkStringBuilder): {
          linters+: {
            settings+: {
              unqueryvet+: {
                'check-string-builder': checkStringBuilder,
              },
            },
          },
        },
        withCheckStringConcat(checkStringConcat): {
          linters+: {
            settings+: {
              unqueryvet+: {
                'check-string-concat': checkStringConcat,
              },
            },
          },
        },
        withCheckSubqueries(checkSubqueries): {
          linters+: {
            settings+: {
              unqueryvet+: {
                'check-subqueries': checkSubqueries,
              },
            },
          },
        },
        withCheckTxLeaks(checkTxLeaks): {
          linters+: {
            settings+: {
              unqueryvet+: {
                'check-tx-leaks': checkTxLeaks,
              },
            },
          },
        },
        withCustomRules(customRules): {
          linters+: {
            settings+: {
              unqueryvet+: {
                'custom-rules': if std.isArray(v=customRules) then customRules else [customRules],
              },
            },
          },
        },
        withCustomRulesMixin(customRules): {
          linters+: {
            settings+: {
              unqueryvet+: {
                'custom-rules'+: if std.isArray(v=customRules) then customRules else [customRules],
              },
            },
          },
        },
        withIgnoredFunctions(ignoredFunctions): {
          linters+: {
            settings+: {
              unqueryvet+: {
                'ignored-functions': if std.isArray(v=ignoredFunctions) then ignoredFunctions else [ignoredFunctions],
              },
            },
          },
        },
        withIgnoredFunctionsMixin(ignoredFunctions): {
          linters+: {
            settings+: {
              unqueryvet+: {
                'ignored-functions'+: if std.isArray(v=ignoredFunctions) then ignoredFunctions else [ignoredFunctions],
              },
            },
          },
        },
      },
      unused: {
        withExportedFieldsAreUsed(exportedFieldsAreUsed): {
          linters+: {
            settings+: {
              unused+: {
                'exported-fields-are-used': exportedFieldsAreUsed,
              },
            },
          },
        },
        withFieldWritesAreUses(fieldWritesAreUses): {
          linters+: {
            settings+: {
              unused+: {
                'field-writes-are-uses': fieldWritesAreUses,
              },
            },
          },
        },
        withGeneratedIsUsed(generatedIsUsed): {
          linters+: {
            settings+: {
              unused+: {
                'generated-is-used': generatedIsUsed,
              },
            },
          },
        },
        withLocalVariablesAreUsed(localVariablesAreUsed): {
          linters+: {
            settings+: {
              unused+: {
                'local-variables-are-used': localVariablesAreUsed,
              },
            },
          },
        },
        withParametersAreUsed(parametersAreUsed): {
          linters+: {
            settings+: {
              unused+: {
                'parameters-are-used': parametersAreUsed,
              },
            },
          },
        },
        withPostStatementsAreReads(postStatementsAreReads): {
          linters+: {
            settings+: {
              unused+: {
                'post-statements-are-reads': postStatementsAreReads,
              },
            },
          },
        },
      },
      usestdlibvars: {
        withConstantKind(constantKind): {
          linters+: {
            settings+: {
              usestdlibvars+: {
                'constant-kind': constantKind,
              },
            },
          },
        },
        withCryptoHash(cryptoHash): {
          linters+: {
            settings+: {
              usestdlibvars+: {
                'crypto-hash': cryptoHash,
              },
            },
          },
        },
        withDefaultRpcPath(defaultRpcPath): {
          linters+: {
            settings+: {
              usestdlibvars+: {
                'default-rpc-path': defaultRpcPath,
              },
            },
          },
        },
        withHttpMethod(httpMethod): {
          linters+: {
            settings+: {
              usestdlibvars+: {
                'http-method': httpMethod,
              },
            },
          },
        },
        withHttpStatusCode(httpStatusCode): {
          linters+: {
            settings+: {
              usestdlibvars+: {
                'http-status-code': httpStatusCode,
              },
            },
          },
        },
        withSqlIsolationLevel(sqlIsolationLevel): {
          linters+: {
            settings+: {
              usestdlibvars+: {
                'sql-isolation-level': sqlIsolationLevel,
              },
            },
          },
        },
        withTimeDateMonth(timeDateMonth): {
          linters+: {
            settings+: {
              usestdlibvars+: {
                'time-date-month': timeDateMonth,
              },
            },
          },
        },
        withTimeLayout(timeLayout): {
          linters+: {
            settings+: {
              usestdlibvars+: {
                'time-layout': timeLayout,
              },
            },
          },
        },
        withTimeMonth(timeMonth): {
          linters+: {
            settings+: {
              usestdlibvars+: {
                'time-month': timeMonth,
              },
            },
          },
        },
        withTimeWeekday(timeWeekday): {
          linters+: {
            settings+: {
              usestdlibvars+: {
                'time-weekday': timeWeekday,
              },
            },
          },
        },
        withTlsSignatureScheme(tlsSignatureScheme): {
          linters+: {
            settings+: {
              usestdlibvars+: {
                'tls-signature-scheme': tlsSignatureScheme,
              },
            },
          },
        },
      },
      usetesting: {
        withContextBackground(contextBackground): {
          linters+: {
            settings+: {
              usetesting+: {
                'context-background': contextBackground,
              },
            },
          },
        },
        withContextTodo(contextTodo): {
          linters+: {
            settings+: {
              usetesting+: {
                'context-todo': contextTodo,
              },
            },
          },
        },
        withOsChdir(osChdir): {
          linters+: {
            settings+: {
              usetesting+: {
                'os-chdir': osChdir,
              },
            },
          },
        },
        withOsCreateTemp(osCreateTemp): {
          linters+: {
            settings+: {
              usetesting+: {
                'os-create-temp': osCreateTemp,
              },
            },
          },
        },
        withOsMkdirTemp(osMkdirTemp): {
          linters+: {
            settings+: {
              usetesting+: {
                'os-mkdir-temp': osMkdirTemp,
              },
            },
          },
        },
        withOsSetenv(osSetenv): {
          linters+: {
            settings+: {
              usetesting+: {
                'os-setenv': osSetenv,
              },
            },
          },
        },
        withOsTempDir(osTempDir): {
          linters+: {
            settings+: {
              usetesting+: {
                'os-temp-dir': osTempDir,
              },
            },
          },
        },
      },
      varnamelen: {
        withCheckReceiver(checkReceiver): {
          linters+: {
            settings+: {
              varnamelen+: {
                'check-receiver': checkReceiver,
              },
            },
          },
        },
        withCheckReturn(checkReturn): {
          linters+: {
            settings+: {
              varnamelen+: {
                'check-return': checkReturn,
              },
            },
          },
        },
        withCheckTypeParam(checkTypeParam): {
          linters+: {
            settings+: {
              varnamelen+: {
                'check-type-param': checkTypeParam,
              },
            },
          },
        },
        withIgnoreChanRecvOk(ignoreChanRecvOk): {
          linters+: {
            settings+: {
              varnamelen+: {
                'ignore-chan-recv-ok': ignoreChanRecvOk,
              },
            },
          },
        },
        withIgnoreDecls(ignoreDecls): {
          linters+: {
            settings+: {
              varnamelen+: {
                'ignore-decls': if std.isArray(v=ignoreDecls) then ignoreDecls else [ignoreDecls],
              },
            },
          },
        },
        withIgnoreDeclsMixin(ignoreDecls): {
          linters+: {
            settings+: {
              varnamelen+: {
                'ignore-decls'+: if std.isArray(v=ignoreDecls) then ignoreDecls else [ignoreDecls],
              },
            },
          },
        },
        withIgnoreMapIndexOk(ignoreMapIndexOk): {
          linters+: {
            settings+: {
              varnamelen+: {
                'ignore-map-index-ok': ignoreMapIndexOk,
              },
            },
          },
        },
        withIgnoreNames(ignoreNames): {
          linters+: {
            settings+: {
              varnamelen+: {
                'ignore-names': if std.isArray(v=ignoreNames) then ignoreNames else [ignoreNames],
              },
            },
          },
        },
        withIgnoreNamesMixin(ignoreNames): {
          linters+: {
            settings+: {
              varnamelen+: {
                'ignore-names'+: if std.isArray(v=ignoreNames) then ignoreNames else [ignoreNames],
              },
            },
          },
        },
        withIgnoreTypeAssertOk(ignoreTypeAssertOk): {
          linters+: {
            settings+: {
              varnamelen+: {
                'ignore-type-assert-ok': ignoreTypeAssertOk,
              },
            },
          },
        },
        withMaxDistance(maxDistance): {
          linters+: {
            settings+: {
              varnamelen+: {
                'max-distance': maxDistance,
              },
            },
          },
        },
        withMinNameLength(minNameLength): {
          linters+: {
            settings+: {
              varnamelen+: {
                'min-name-length': minNameLength,
              },
            },
          },
        },
      },
      whitespace: {
        withMultiFunc(multiFunc): {
          linters+: {
            settings+: {
              whitespace+: {
                'multi-func': multiFunc,
              },
            },
          },
        },
        withMultiIf(multiIf): {
          linters+: {
            settings+: {
              whitespace+: {
                'multi-if': multiIf,
              },
            },
          },
        },
      },
      wrapcheck: {
        withExtraIgnoreSigs(extraIgnoreSigs): {
          linters+: {
            settings+: {
              wrapcheck+: {
                'extra-ignore-sigs': if std.isArray(v=extraIgnoreSigs) then extraIgnoreSigs else [extraIgnoreSigs],
              },
            },
          },
        },
        withExtraIgnoreSigsMixin(extraIgnoreSigs): {
          linters+: {
            settings+: {
              wrapcheck+: {
                'extra-ignore-sigs'+: if std.isArray(v=extraIgnoreSigs) then extraIgnoreSigs else [extraIgnoreSigs],
              },
            },
          },
        },
        withIgnoreInterfaceRegexps(ignoreInterfaceRegexps): {
          linters+: {
            settings+: {
              wrapcheck+: {
                'ignore-interface-regexps': if std.isArray(v=ignoreInterfaceRegexps) then ignoreInterfaceRegexps else [ignoreInterfaceRegexps],
              },
            },
          },
        },
        withIgnoreInterfaceRegexpsMixin(ignoreInterfaceRegexps): {
          linters+: {
            settings+: {
              wrapcheck+: {
                'ignore-interface-regexps'+: if std.isArray(v=ignoreInterfaceRegexps) then ignoreInterfaceRegexps else [ignoreInterfaceRegexps],
              },
            },
          },
        },
        withIgnorePackageGlobs(ignorePackageGlobs): {
          linters+: {
            settings+: {
              wrapcheck+: {
                'ignore-package-globs': if std.isArray(v=ignorePackageGlobs) then ignorePackageGlobs else [ignorePackageGlobs],
              },
            },
          },
        },
        withIgnorePackageGlobsMixin(ignorePackageGlobs): {
          linters+: {
            settings+: {
              wrapcheck+: {
                'ignore-package-globs'+: if std.isArray(v=ignorePackageGlobs) then ignorePackageGlobs else [ignorePackageGlobs],
              },
            },
          },
        },
        withIgnoreSigRegexps(ignoreSigRegexps): {
          linters+: {
            settings+: {
              wrapcheck+: {
                'ignore-sig-regexps': if std.isArray(v=ignoreSigRegexps) then ignoreSigRegexps else [ignoreSigRegexps],
              },
            },
          },
        },
        withIgnoreSigRegexpsMixin(ignoreSigRegexps): {
          linters+: {
            settings+: {
              wrapcheck+: {
                'ignore-sig-regexps'+: if std.isArray(v=ignoreSigRegexps) then ignoreSigRegexps else [ignoreSigRegexps],
              },
            },
          },
        },
        withIgnoreSigs(ignoreSigs): {
          linters+: {
            settings+: {
              wrapcheck+: {
                'ignore-sigs': if std.isArray(v=ignoreSigs) then ignoreSigs else [ignoreSigs],
              },
            },
          },
        },
        withIgnoreSigsMixin(ignoreSigs): {
          linters+: {
            settings+: {
              wrapcheck+: {
                'ignore-sigs'+: if std.isArray(v=ignoreSigs) then ignoreSigs else [ignoreSigs],
              },
            },
          },
        },
        withReportInternalErrors(reportInternalErrors): {
          linters+: {
            settings+: {
              wrapcheck+: {
                'report-internal-errors': reportInternalErrors,
              },
            },
          },
        },
      },
      wsl: {
        withAllowAssignAndAnything(allowAssignAndAnything): {
          linters+: {
            settings+: {
              wsl+: {
                'allow-assign-and-anything': allowAssignAndAnything,
              },
            },
          },
        },
        withAllowAssignAndCall(allowAssignAndCall): {
          linters+: {
            settings+: {
              wsl+: {
                'allow-assign-and-call': allowAssignAndCall,
              },
            },
          },
        },
        withAllowCuddleDeclarations(allowCuddleDeclarations): {
          linters+: {
            settings+: {
              wsl+: {
                'allow-cuddle-declarations': allowCuddleDeclarations,
              },
            },
          },
        },
        withAllowCuddleUsedInBlock(allowCuddleUsedInBlock): {
          linters+: {
            settings+: {
              wsl+: {
                'allow-cuddle-used-in-block': allowCuddleUsedInBlock,
              },
            },
          },
        },
        withAllowCuddleWithCalls(allowCuddleWithCalls): {
          linters+: {
            settings+: {
              wsl+: {
                'allow-cuddle-with-calls': if std.isArray(v=allowCuddleWithCalls) then allowCuddleWithCalls else [allowCuddleWithCalls],
              },
            },
          },
        },
        withAllowCuddleWithCallsMixin(allowCuddleWithCalls): {
          linters+: {
            settings+: {
              wsl+: {
                'allow-cuddle-with-calls'+: if std.isArray(v=allowCuddleWithCalls) then allowCuddleWithCalls else [allowCuddleWithCalls],
              },
            },
          },
        },
        withAllowCuddleWithRhs(allowCuddleWithRhs): {
          linters+: {
            settings+: {
              wsl+: {
                'allow-cuddle-with-rhs': if std.isArray(v=allowCuddleWithRhs) then allowCuddleWithRhs else [allowCuddleWithRhs],
              },
            },
          },
        },
        withAllowCuddleWithRhsMixin(allowCuddleWithRhs): {
          linters+: {
            settings+: {
              wsl+: {
                'allow-cuddle-with-rhs'+: if std.isArray(v=allowCuddleWithRhs) then allowCuddleWithRhs else [allowCuddleWithRhs],
              },
            },
          },
        },
        withAllowMultilineAssign(allowMultilineAssign): {
          linters+: {
            settings+: {
              wsl+: {
                'allow-multiline-assign': allowMultilineAssign,
              },
            },
          },
        },
        withAllowSeparatedLeadingComment(allowSeparatedLeadingComment): {
          linters+: {
            settings+: {
              wsl+: {
                'allow-separated-leading-comment': allowSeparatedLeadingComment,
              },
            },
          },
        },
        withAllowTrailingComment(allowTrailingComment): {
          linters+: {
            settings+: {
              wsl+: {
                'allow-trailing-comment': allowTrailingComment,
              },
            },
          },
        },
        withErrorVariableNames(errorVariableNames): {
          linters+: {
            settings+: {
              wsl+: {
                'error-variable-names': if std.isArray(v=errorVariableNames) then errorVariableNames else [errorVariableNames],
              },
            },
          },
        },
        withErrorVariableNamesMixin(errorVariableNames): {
          linters+: {
            settings+: {
              wsl+: {
                'error-variable-names'+: if std.isArray(v=errorVariableNames) then errorVariableNames else [errorVariableNames],
              },
            },
          },
        },
        withForceCaseTrailingWhitespace(forceCaseTrailingWhitespace): {
          linters+: {
            settings+: {
              wsl+: {
                'force-case-trailing-whitespace': forceCaseTrailingWhitespace,
              },
            },
          },
        },
        withForceErrCuddling(forceErrCuddling): {
          linters+: {
            settings+: {
              wsl+: {
                'force-err-cuddling': forceErrCuddling,
              },
            },
          },
        },
        withForceShortDeclCuddling(forceShortDeclCuddling): {
          linters+: {
            settings+: {
              wsl+: {
                'force-short-decl-cuddling': forceShortDeclCuddling,
              },
            },
          },
        },
        withStrictAppend(strictAppend): {
          linters+: {
            settings+: {
              wsl+: {
                'strict-append': strictAppend,
              },
            },
          },
        },
      },
      wslV5: {
        withAllowFirstInBlock(allowFirstInBlock): {
          linters+: {
            settings+: {
              wsl_v5+: {
                'allow-first-in-block': allowFirstInBlock,
              },
            },
          },
        },
        withAllowWholeBlock(allowWholeBlock): {
          linters+: {
            settings+: {
              wsl_v5+: {
                'allow-whole-block': allowWholeBlock,
              },
            },
          },
        },
        withBranchMaxLines(branchMaxLines): {
          linters+: {
            settings+: {
              wsl_v5+: {
                'branch-max-lines': branchMaxLines,
              },
            },
          },
        },
        withCaseMaxLines(caseMaxLines): {
          linters+: {
            settings+: {
              wsl_v5+: {
                'case-max-lines': caseMaxLines,
              },
            },
          },
        },
        withCuddleMaxStatements(cuddleMaxStatements): {
          linters+: {
            settings+: {
              wsl_v5+: {
                'cuddle-max-statements': cuddleMaxStatements,
              },
            },
          },
        },
        withDefault(default): {
          linters+: {
            settings+: {
              wsl_v5+: {
                default: default,
              },
            },
          },
        },
        withDisable(disable): {
          linters+: {
            settings+: {
              wsl_v5+: {
                disable: if std.isArray(v=disable) then disable else [disable],
              },
            },
          },
        },
        withDisableMixin(disable): {
          linters+: {
            settings+: {
              wsl_v5+: {
                disable+: if std.isArray(v=disable) then disable else [disable],
              },
            },
          },
        },
        withEnable(enable): {
          linters+: {
            settings+: {
              wsl_v5+: {
                enable: if std.isArray(v=enable) then enable else [enable],
              },
            },
          },
        },
        withEnableMixin(enable): {
          linters+: {
            settings+: {
              wsl_v5+: {
                enable+: if std.isArray(v=enable) then enable else [enable],
              },
            },
          },
        },
      },
    },
    withDefault(default): {
      linters+: {
        default: default,
      },
    },
    withDisable(disable): {
      linters+: {
        disable: if std.isArray(v=disable) then disable else [disable],
      },
    },
    withDisableMixin(disable): {
      linters+: {
        disable+: if std.isArray(v=disable) then disable else [disable],
      },
    },
    withEnable(enable): {
      linters+: {
        enable: if std.isArray(v=enable) then enable else [enable],
      },
    },
    withEnableMixin(enable): {
      linters+: {
        enable+: if std.isArray(v=enable) then enable else [enable],
      },
    },
  },
  output: {
    formats: {
      checkstyle: {
        withPath(path): {
          output+: {
            formats+: {
              checkstyle+: {
                path: path,
              },
            },
          },
        },
      },
      codeClimate: {
        withPath(path): {
          output+: {
            formats+: {
              'code-climate'+: {
                path: path,
              },
            },
          },
        },
      },
      html: {
        withPath(path): {
          output+: {
            formats+: {
              html+: {
                path: path,
              },
            },
          },
        },
      },
      json: {
        withPath(path): {
          output+: {
            formats+: {
              json+: {
                path: path,
              },
            },
          },
        },
      },
      junitXml: {
        withExtended(extended): {
          output+: {
            formats+: {
              'junit-xml'+: {
                extended: extended,
              },
            },
          },
        },
        withPath(path): {
          output+: {
            formats+: {
              'junit-xml'+: {
                path: path,
              },
            },
          },
        },
      },
      sarif: {
        withPath(path): {
          output+: {
            formats+: {
              sarif+: {
                path: path,
              },
            },
          },
        },
      },
      tab: {
        withColors(colors): {
          output+: {
            formats+: {
              tab+: {
                colors: colors,
              },
            },
          },
        },
        withPath(path): {
          output+: {
            formats+: {
              tab+: {
                path: path,
              },
            },
          },
        },
        withPrintLinterName(printLinterName): {
          output+: {
            formats+: {
              tab+: {
                'print-linter-name': printLinterName,
              },
            },
          },
        },
      },
      teamcity: {
        withPath(path): {
          output+: {
            formats+: {
              teamcity+: {
                path: path,
              },
            },
          },
        },
      },
      text: {
        withColors(colors): {
          output+: {
            formats+: {
              text+: {
                colors: colors,
              },
            },
          },
        },
        withPath(path): {
          output+: {
            formats+: {
              text+: {
                path: path,
              },
            },
          },
        },
        withPrintIssuedLines(printIssuedLines): {
          output+: {
            formats+: {
              text+: {
                'print-issued-lines': printIssuedLines,
              },
            },
          },
        },
        withPrintLinterName(printLinterName): {
          output+: {
            formats+: {
              text+: {
                'print-linter-name': printLinterName,
              },
            },
          },
        },
      },
    },
    withPathMode(pathMode): {
      output+: {
        'path-mode': pathMode,
      },
    },
    withPathPrefix(pathPrefix): {
      output+: {
        'path-prefix': pathPrefix,
      },
    },
    withShowStats(showStats): {
      output+: {
        'show-stats': showStats,
      },
    },
    withSortOrder(sortOrder): {
      output+: {
        'sort-order': if std.isArray(v=sortOrder) then sortOrder else [sortOrder],
      },
    },
    withSortOrderMixin(sortOrder): {
      output+: {
        'sort-order'+: if std.isArray(v=sortOrder) then sortOrder else [sortOrder],
      },
    },
  },
  run: {
    withAllowParallelRunners(allowParallelRunners): {
      run+: {
        'allow-parallel-runners': allowParallelRunners,
      },
    },
    withAllowSerialRunners(allowSerialRunners): {
      run+: {
        'allow-serial-runners': allowSerialRunners,
      },
    },
    withBuildTags(buildTags): {
      run+: {
        'build-tags': if std.isArray(v=buildTags) then buildTags else [buildTags],
      },
    },
    withBuildTagsMixin(buildTags): {
      run+: {
        'build-tags'+: if std.isArray(v=buildTags) then buildTags else [buildTags],
      },
    },
    withConcurrency(concurrency): {
      run+: {
        concurrency: concurrency,
      },
    },
    withEnableBuildVcs(enableBuildVcs): {
      run+: {
        'enable-build-vcs': enableBuildVcs,
      },
    },
    withGo(go): {
      run+: {
        go: go,
      },
    },
    withIssuesExitCode(issuesExitCode): {
      run+: {
        'issues-exit-code': issuesExitCode,
      },
    },
    withModulesDownloadMode(modulesDownloadMode): {
      run+: {
        'modules-download-mode': modulesDownloadMode,
      },
    },
    withRelativePathMode(relativePathMode): {
      run+: {
        'relative-path-mode': relativePathMode,
      },
    },
    withTests(tests): {
      run+: {
        tests: tests,
      },
    },
    withTimeout(timeout): {
      run+: {
        timeout: timeout,
      },
    },
  },
  severity: {
    withDefault(default): {
      severity+: {
        default: default,
      },
    },
    withRules(rules): {
      severity+: {
        rules: if std.isArray(v=rules) then rules else [rules],
      },
    },
    withRulesMixin(rules): {
      severity+: {
        rules+: if std.isArray(v=rules) then rules else [rules],
      },
    },
  },
  withVersion(version): {
    version: version,
  },
}
