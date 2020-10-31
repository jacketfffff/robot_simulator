
#include "ros/ros.h"
#include "basecontrol/basecontrol.h"
#include "ros/package.h"
#include "basecontrol.cpp"
#include "basecontrol/JoyTeleop.h"

using namespace JOYTELEOP;

int main(int argc, char** argv)
{
    ros::init(argc, argv, "base_Only");
    ros::NodeHandle nh_("~");
    const std::string parameter_addr{ros::package::getPath("basecontrol")+"/config/basemodel.yaml"};//添加参数文件
    double max_linear_velocity, max_angular_velocity;
    std::string base_foot_print,odom_frame,map_frame,serial_addr;
    bool publish_tf;

    nh_.param("publish_tf", publish_tf, (bool)false);
    nh_.param("base_foot_print", base_foot_print, (std::string)"base_link");
    nh_.param("odom_frame", odom_frame, (std::string)"odom");
    nh_.param("serial_addr", serial_addr, (std::string)"/dev/ttyUSB1");

   JoyTeleop joyTeleop("/joy",true,0.25,0.4);
    BaseController baseController(serial_addr, B115200, base_foot_print, odom_frame, publish_tf);
    baseController.setBaseModel(parameter_addr);

    ros::AsyncSpinner spinner(3);
    spinner.start();
    ros::Rate loop_rate(30);

    while(ros::ok)
    {   
        switch(joyTeleop.getControlTrigger())
        {
            case Reset:
                //TODO reset
                std::cout << "Reset" << std::endl;
                break;//A
            case Jump:
                //TODO jump
                std::cout << "Jump" << std::endl;
                break;//B
            case JointLock:
                std::cout << "Joint_lock" << std::endl;
                baseController.joint_lock();
                break;//X
            case Squat: 
                std::cout << "Squat" << std::endl;
                baseController.SquatController(100);
                break;//Y
            case MoveForward: 
                baseController.sendCommand(baseController.MOVEFORWARD);
                break;//up
            case MoveBack:
                baseController.sendCommand(baseController.MOVEBACK);
                break;//down
            case TurnLeft:
                baseController.sendCommand(baseController.TURNLEFT);
                break;//left
            case TurnRight:
                baseController.sendCommand(baseController.TURNRIGHT);
                break;//right
        }
        ros::spinOnce();
        loop_rate.sleep();
    }
    return 0;
}
