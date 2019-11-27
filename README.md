# Christmas Songs Statistics

A little background... I put together this site as an experiment to see if what I suspect is true. Are there really only 20 Christmas songs but performed by various artists.

This project pulls data from radio.com using [Nokogiri](https://nokogiri.org/) and stores the data in a Rails model. 

Right now the data is just presented in a summary view in the index file using [ChartKick](https://chartkick.com/). But the goal is to convert this data into a Infographic. 

## Next Steps:

- Get better statistics in the form of an infographic
- Make the radio.com configurable 
- Store the radiostation as a separate model, so we can track multiple simultaneously. 
- Add in cron job scheduling in app. 


