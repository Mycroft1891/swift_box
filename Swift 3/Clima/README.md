# Clima

My own version of the Clima app from the London Brewery course on Udemy. 

## Finished App
![Finished App](https://github.com/londonappbrewery/Images/blob/master/Clima.gif)

## Fix for App Transport Security Override

```XML
	<key>NSAppTransportSecurity</key>
	<dict>
		<key>NSExceptionDomains</key>
		<dict>
			<key>openweathermap.org</key>
			<dict>
				<key>NSIncludesSubdomains</key>
				<true/>
				<key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
				<true/>
			</dict>
		</dict>
	</dict>
```


Copyright 2016 London App Brewery
