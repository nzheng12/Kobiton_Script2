# Kobiton_Script2

I used powershell for this following challenge for the same reason as challenge 1. I am not the best with powershell but it is what I am familiar with. I first have to grab each log file within the log folder by using the get-childitem, once that have been achieved I proceed to utilize the forEach-object to grab the content within each log file. After I grabbed the content, I looped through every line within the content and then used Regex to find the date/time pattern of that stack trace. After finding the date then I proceed to the next line to see if I have a matching string and if the string matches then I'll check if that string is the first occurance. Once that string returns as the first occurance then I set that date as the variable for first occurance and to get the latest occurace I basically made a comparison on every date I found. The one with the greatest value will be the lastest occurance. For the first occurance and lastest occurance, I assigned them as a global variable. Lastly I proceed on printing out the result in a text file.
