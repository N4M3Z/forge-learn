# forge-learn Makefile

AGENT_SRC = agents
SKILL_SRC = skills
LIB_DIR  = $(or $(FORGE_LIB),lib)

# Fallbacks when common.mk is not yet available (uninitialized submodule)
INSTALL_AGENTS  ?= $(LIB_DIR)/bin/install-agents
INSTALL_SKILLS  ?= $(LIB_DIR)/bin/install-skills
VALIDATE_MODULE ?= $(LIB_DIR)/bin/validate-module

.PHONY: help install clean verify test lint check init check-lib

help:
	@echo "forge-learn management commands:"
	@echo "  make install         Install agents + skills for all providers (SCOPE=workspace|user|all, default: workspace)"
	@echo "  make install-agents  Install agents only"
	@echo "  make install-skills  Install skills for Claude, Gemini, Codex, and OpenCode"
	@echo "  make verify          Verify the full installation (agents + skills)"
	@echo "  make clean           Remove previously installed agents + skills"
	@echo "  make test            Run module validation"
	@echo "  make lint            Shellcheck all scripts + mdschema checks"
	@echo "  make check           Verify module structure"

init:
	@if [ ! -f $(LIB_DIR)/Cargo.toml ]; then \
	  echo "Initializing forge-lib submodule..."; \
	  git submodule update --init $(LIB_DIR); \
	fi

ifneq ($(wildcard $(LIB_DIR)/mk/common.mk),)
  include $(LIB_DIR)/mk/common.mk
  include $(LIB_DIR)/mk/skills/install.mk
  include $(LIB_DIR)/mk/skills/verify.mk
  include $(LIB_DIR)/mk/agents/install.mk
  include $(LIB_DIR)/mk/agents/verify.mk
  include $(LIB_DIR)/mk/lint.mk
endif

check-lib:
	@if [ ! -f "$(LIB_DIR)/Cargo.toml" ]; then \
	  echo ""; \
	  echo "ERROR: forge-lib submodule is not initialized."; \
	  echo "Run: make init && make install"; \
	  echo ""; \
	  exit 1; \
	fi

install: check-lib install-agents install-skills
	@echo "Installation complete (SCOPE=$(SCOPE)). Restart your session or reload agents/skills."

clean: clean-agents clean-skills

verify: verify-skills verify-agents

test: $(VALIDATE_MODULE)
	@$(VALIDATE_MODULE) $(CURDIR)

lint: lint-schema lint-shell

check:
	@test -f module.yaml && echo "  ok module.yaml" || echo "  MISSING module.yaml"
	@test -f defaults.yaml && echo "  ok defaults.yaml" || echo "  MISSING defaults.yaml"
	@test -d skills && echo "  ok skills/" || echo "  MISSING skills/"
	@test -d agents && echo "  ok agents/" || echo "  MISSING agents/"
	@test -d steering && echo "  ok steering/" || echo "  MISSING steering/"
	@test -x "$(INSTALL_AGENTS)" && echo "  ok install-agents" || echo "  MISSING install-agents (run: make -C $(LIB_DIR) build)"
	@test -x "$(INSTALL_SKILLS)" && echo "  ok install-skills" || echo "  MISSING install-skills (run: make -C $(LIB_DIR) build)"
	@test -x "$(VALIDATE_MODULE)" && echo "  ok validate-module" || echo "  MISSING validate-module (run: make -C $(LIB_DIR) build)"
