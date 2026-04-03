#ifndef APE_BASE_STDLIB
#define APE_BASE_STDLIB
//  base implementations and the file to be included : ------------------------------- (section)  //

#include <math.h>

#include "interfaces.hpp"

//  Math : --------------------------------------------------------------------------- (section)  //

#define Lerp(t, begin, end) (t * begin + (1 - t) * end)

quat euler_to_quat(f32 roll, f32 pitch, f32 yaw) {

    f32 cr = cosf(roll * 0.5f);
    f32 sr = sinf(roll * 0.5f);
    f32 cp = cosf(pitch * 0.5f);
    f32 sp = sinf(pitch * 0.5f);
    f32 cy = cosf(yaw * 0.5f);
    f32 sy = sinf(yaw * 0.5f);

    quat q;

    q.w = cr * cp * cy + sr * sp * sy;
    q.x = sr * cp * cy - cr * sp * sy;
    q.y = cr * sp * cy + sr * cp * sy;
    q.z = cr * cp * sy - sr * sp * cy;

    return q;
}

v3 lerp(v3 a, v3 b, f32 t) {
	v3 res = {0};
	res.x = Lerp(t, a.x, b.x);
	res.y = Lerp(t, a.y, b.y);
	res.z = Lerp(t, a.z, b.z);
	return res;
}

v3 operator-(v3 a, v3 b) {
    v3 res = {0};
    res.x  = a.x - b.x;
    res.y  = a.y - b.y;
    res.z  = a.z - b.z;
    return res;
}

f32 operator*(v3 a, v3 b) {
    f32 res = 0;
    res  += a.x * b.x;
    res  += a.y * b.y;
    res  += a.z * b.z;
    return res;
}

v3 normal(v3 v) {
    v3  res = {0};
    f32 w   = (f32)sqrt((v.x * v.x) + (v.y * v.y) + (v.z * v.z));

    res.x = v.x / w;
    res.y = v.y / w;
    res.z = v.z / w;

    return res;
}

v3 operator*(f32 s, v3 v) {
	v3 res = {0};
	res.x = s * v.x;
	res.y = s * v.y;
	res.z = s * v.z;
	return res;
}


v3 operator^(v3 a, v3 b) {
    v3 res = {0};

    res.x = a.y * b.z - a.z * b.y;
    res.y = a.z * b.x - a.x * b.z;
    res.z = a.x * b.y - a.y * b.x;

    return res;
}

//  (section) --------------------------------------------------------------------------- : Math  //

//  (section) ------------------------------- : base implementations and the file to be included  //
#endif
