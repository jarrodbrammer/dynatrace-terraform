# Dynatrace Terraform
---
This uses the following file structure:
-apps
    --app1
        --dev
        --tst
        --ldt
        --ppd
        --prd
    --app2
        --dev
        --tst
        --ldt
        --ppd
        --prd
    --app3
        --dev
        --tst
        --ldt
        --ppd
        --prd
---

The `.bashrc` contains a function to allow local terraform devleopment via vscode.
It performs the following:
1. Inits in the directory
2. Tells you which app and env you're editing
3. Connects to a gitlab state backend.

    
