import tsparser from "@typescript-eslint/parser";
import obsidianmd from "eslint-plugin-obsidianmd";

export default [
  {
    ignores: ["node_modules/**", "package-lock.json", "eslint.config.mjs", "tsconfig.json", "assets/**", "src/**"],
  },
  ...obsidianmd.configs.recommended,
  {
    // Override: disable type-checked rules for all files by default
    // to prevent crashes on non-TS files.
    rules: {
      "obsidianmd/no-plugin-as-component": "off",
      "obsidianmd/no-view-references-in-plugin": "off",
      "obsidianmd/no-unsupported-api": "off",
      "obsidianmd/prefer-file-manager-trash-file": "off",
      "obsidianmd/prefer-instanceof": "off",
    }
  },
  {
    files: ["**/*.ts"],
    languageOptions: {
      parser: tsparser,
      parserOptions: { 
        project: "./tsconfig.json",
      },
    },
    rules: {
      // Re-enable them for TS files
      "obsidianmd/no-plugin-as-component": "error",
      "obsidianmd/no-view-references-in-plugin": "error",
      "obsidianmd/no-unsupported-api": "error",
      "obsidianmd/prefer-file-manager-trash-file": "warn",
      "obsidianmd/prefer-instanceof": "error",
    }
  }
];
