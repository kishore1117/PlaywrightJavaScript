module.exports ={
    default:{
        paths:[
            "tests/features/*.feature"
        ],
        dryRun: false,
        format:[
            "progress-bar",
            "summary",
            "json:reports/cucumber-report.json",
            "html:reports/cucumber-report.html"
        ],
        formatOptions:{
            colorsEnabled:true,
            snippetInterface:"async-await"
        },
        require:[
            'tests/stepDefinitions/*.js'
        ]
    }
}