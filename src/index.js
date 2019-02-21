import hapi from 'hapi';
import routes from './routes/index';
const Inert = require('inert');
const Vision = require('vision');
const HapiSwagger = require('hapi-swagger');

const server = hapi.server({
    port: 8787,
    host: 'localhost',
    routes: { cors: true }
    // JV: Note that we need to check (with a checklist!) all security issues
    // before publishing even demo versions of the app. Including removing
    // any possible Cors:* . Now everybody will use different host = computer
    // to run the front-end. Thus back-end cannot restrict API calls to
    // certain address, thus in testing simple examples, you sometimes
    // need *. But that is not allowed in production network! Then
    // we will accept only calls from the front end web server,
    // which will likely to be in AWS, Amazon web services.

    // Remember that the node front-end server is just for easy development,
    // final web server will only have a compressed html+js+css package,
    // with no node modules folder etc. So any settings we put to backend's
    // CORS now, _cannot_ be final!
});


const init = async () => {

    //add api prefix to all routes
    server.realm.modifiers.route.prefix = '/api'
    //wait for routes defined in ./routes/index to be attached
    await server.route(routes);

    // activate documentation endpoint
    const swaggerOptions = {
        info: {
            title: 'connectNPlay API Documentation',
            version: '1.0',
        },
    };

    await server.register([
        Inert,
        Vision,
        {
            plugin: HapiSwagger,
            options: swaggerOptions
        }
    ]);
    //wait for server to start
    await server.start();
    console.log(`Server running at: ${server.info.uri}/api`)
}

init();
