# Dynatrace Terraform

This uses the following file structure:
```
apps/
├── app1/
│   ├── dev/
│   ├── tst/
│   ├── ldt/
│   ├── ppd/
│   └── prd/
├── app2/
│   ├── dev/
│   ├── tst/
│   ├── ldt/
│   ├── ppd/
│   └── prd/
└── app3/
    ├── dev/
    ├── tst/
    ├── ldt/
```

## dtinit function
The `.bashrc` contains a function to allow local terraform devleopment via vscode.
It performs the following:
1. Terraform Inits in the directory and checks if it's a directory you should be editing.
2. Tells you which app and env you're editing
3. Connects to a Gitlab state backend. In future we can use TFE backends.

## Templating
COMING SOON...


    
