module.exports ={
    default:{
        paths:[
            "tests/features/*.feature"
        ],
        dryRun: false,
        format:[
            "progress-bar",
            "summary",
            "json:target/cucumber-report.json",
            "html:target/cucumber-report.html"
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