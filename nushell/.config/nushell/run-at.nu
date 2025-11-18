#!/usr/bin/env nu

# Use as sourced function:
#   source tools/time-trigger.nu
#   time-trigger "2025-11-11 19:30:00" {|| echo "Time's up!" }

def main [
    target_time: string, # Target timestamp in a valid datetime format
    callback: closure # Closure https://www.nushell.sh/lang-guide/chapters/types/basic_types/closure.html
] {
    print $"Waiting until ($target_time) to execute closure..."
    let target = ($target_time | into datetime)
    loop {
        let now = (date now)
        if $now >= $target {
            print "Target time reached! Executing..."
            do $callback
            print "Done!"
            break
        }
        let remaining = ($target - $now)
        print $"Current time: ($now | format date %+)"
        print $"Time remaining: ($remaining)"
        sleep 1sec
    }
}

# Convenience alias when sourced
export alias run-at = main
