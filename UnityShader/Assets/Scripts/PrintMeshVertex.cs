using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PrintMeshVertex : MonoBehaviour
{

    public Mesh mesh;
    Vector3 minv, maxv;

    // Start is called before the first frame update
    void Start()
    {
        mesh = GetComponent<MeshFilter>().mesh;
        minv = Vector3.positiveInfinity;
        maxv = Vector3.negativeInfinity;
        foreach(var v in mesh.vertices)
        {
            print(v);
            if (v.x < minv.x)
            {
                minv.x = v.x;
            }
            else if(v.x > maxv.x)
            {
                maxv.x = v.x;
            }
            if (v.y < minv.y)
            {
                minv.y = v.y;
            }
            else if (v.y > maxv.y)
            {
                maxv.y = v.y;
            }
            if (v.z < minv.z)
            {
                minv.z = v.z;
            }
            else if (v.z > maxv.z)
            {
                maxv.z = v.z;
            }
        }
        string output = "min x: " + minv.x + "  min y: " + minv.y + "  min z: " + minv.z;
        output += "\nmax x: " + maxv.x + "  max y: " + maxv.y + "  max z: " + maxv.z;
        print(output);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
