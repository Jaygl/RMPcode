function [  ] = phi_plotTangents(  )
%PHI_PLOTTANGENTS Plots the 2 stereographic mappings phiS and phiN and then
%overlays the mapping of the curve c(t) = (ax*t+bx, ay*t+by) for t = [-1 1]
%onto the sphere. It also includes the tangent vector at t = 0. We do this
%for (ax, bx, ay, by) = ( .25, 0, 0, -.25 ), ( 0, 0, .25, -.25 ), 
%( .2, 0, .2, -.25 ), and ( -.2, 0, -.2, -.25 ).

phi_plot
hold on
[gamma gammadot] = phiPushCurveForward( .25, 0, 0, -.25 )
[gamma gammadot] = phiPushCurveForward( 0, 0, .25, -.25 )
[gamma gammadot] = phiPushCurveForward( .2, 0, .2, -.25 )
[gamma gammadot] = phiPushCurveForward( -.2, 0, -.2, -.25 )

end

