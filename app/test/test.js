const request = require('supertest');
const { expect } = require('chai');
const app = require('../src/app');

describe('GET /', () => {
    it('should return a 200 OK status and HTML content', (done) => {
        request(app)
            .get('/')
            .expect(200)
            .end((err, res) => {
                if (err) return done(err);
                // UPDATED: We are now checking for the new text in our navbar
                expect(res.text).to.include('Tech Store');
                done();
            });
    });
});