 https://practicetestautomation.com/practice-test-login/
 https://practicetestautomation.com/practice-test-exceptions/
 https://www.demoblaze.com

# Create virtual environment
    - create venv `python -m venv {venv_name}`

# Modules
    - install robot `pip install robotframework-seleniumlibrary`
    - install yaml `pip install pyyaml`

# Directories structure
```
robot_project/
│
├── tests/
│   ├── api/
│   │   └── login_api.robot
│   └── ui/
│       └── login_ui.robot
│
├── resources/
│   ├── keywords/
│   │   └── common_keywords.robot
│   ├── variables/
│   │   └── global_variables.robot
│   └── locators/
│       └── login_page.robot
│
├── libs/
│   └── custom_lib.py
│
├── results/
│
├── configs/
│   ├── dev.yaml
│   ├── test.yaml
│   └── prod.yaml
│
├── .gitignore
├── requirements.txt
└── README.md
```