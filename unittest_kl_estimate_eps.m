function unittest_kl_estimate_eps
% UNITTEST_KL_ESTIMATE_EPS Test the KL_ESTIMATE_EPS function.
%
% Example (<a href="matlab:run_example unittest_kl_estimate_eps">run</a>)
%   unittest_kl_estimate_eps
%
% See also KL_ESTIMATE_EPS, TESTSUITE 

%   Elmar Zander
%   Copyright 2010, Inst. of Scientific Comuting
%   $Id$ 
%
%   This program is free software: you can redistribute it and/or modify it
%   under the terms of the GNU General Public License as published by the
%   Free Software Foundation, either version 3 of the License, or (at your
%   option) any later version. 
%   See the GNU General Public License for more details. You should have
%   received a copy of the GNU General Public License along with this
%   program.  If not, see <http://www.gnu.org/licenses/>.

munit_set_function( 'kl_estimate_eps' );

N=20;
r=exp(-2.3);
r=0.9;
A=3;

k=0:N;
sigma=A*r.^k;
[eps_est,alg]=kl_estimate_eps( sigma );
eps_true=sqrt(r^(2*(N+1)));
eps_true2=norm( r.^((N+1):10000) )/norm( r.^(0:10000) );
assert_equals( eps_est, eps_true, 'exponential' );
assert_equals( eps_est, eps_true2, 'exponential2' );
assert_false( alg, 'should not detect algebraic decay', 'not_alg' );


k=1:N;
sigma=A*k.^-2;
[eps_est,alg]=kl_estimate_eps( sigma );
eps_true2=norm( ((N+1):10000).^-2 )/norm( (1:10000).^-2 );
assert_equals( eps_est, eps_true2, 'algeb2' );
assert_true( alg, 'should detect algebraic decay', 'is_alg' );



