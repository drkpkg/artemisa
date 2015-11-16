Artemisa, System of management veterinary clinic and animal refuge

For the moment this software is current in development, i'm trying to finish it ASAP.

INSTRUCTIONS:

    Download the code
        git clone https://github.com/drkpkg/artemisa.git
    Change branch to development
        git checkout development
    Create a .env file. See the .env example
    Run bundle install
    Run migrations and seeds
        rake db:create db:migrate db:setup In some rails versions is:
        rake db:setup 
    Run the server
        rails s

If you want contribute with code, ideas or feedback will be awesome. I'm not a rails senior but i'm trying to do my best work :)

TODO:

    Localization
    Restful API for mobile version
    Uploading files
    Setup configuration page
    Animal refuge mode
    Trello public board

I will adding more things in the list if I have an idea.
