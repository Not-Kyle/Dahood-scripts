getgenv().Orbit = {
    Silent = {
        SilentToggle = 'P',
        Enabled = true,
        AimPart = "UpperTorso",
        Prediction = 0.11645,
        ClosestPart = true
    },
    FOV = {
        Visible = false,
        Radius = 15.5,
    },

    Tracer = {
        TracerToggle = "E",
        Enabled = true,
        AimPart = "UpperTorso",
        Prediction = 7.62,
        SmoothnessValue = 0.035,
        Smoothness = true,
        TraceClosestPart = true,
        UseTracerRadius = false,
        Radius = 150,
        ShowFOV = false
    },
    Resolver = {
        AutoResolve = false,
        Positive = 80,
        Negative = -40,
    },

    Extras = {
        WallCheck = true,
        UnlockedOnDeath = true,
    },
}
    
loadstring(game:HttpGet("https://raw.githubusercontent.com/primegotemdontworry/orbit-/main/orbits"))()
