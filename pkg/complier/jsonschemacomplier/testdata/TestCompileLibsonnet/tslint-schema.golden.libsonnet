{
  linterOptions: {
    withExclude(exclude): {
      linterOptions+: {
        exclude: if std.isArray(v=exclude) then exclude else [exclude],
      },
    },
    withExcludeMixin(exclude): {
      linterOptions+: {
        exclude+: if std.isArray(v=exclude) then exclude else [exclude],
      },
    },
  },
  withDefaultSeverity(defaultSeverity): {
    defaultSeverity: defaultSeverity,
  },
  withExtends(extends): {
    extends: extends,
  },
  withJsRules(jsRules): {
    jsRules: jsRules,
  },
  withRules(rules): {
    rules: rules,
  },
  withRulesDirectory(rulesDirectory): {
    rulesDirectory: rulesDirectory,
  },
}
