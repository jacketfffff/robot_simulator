#ifndef WHEEL_FOOT_ROBOT_BASECONTROL_H
#define WHEEL_FOOT_ROBOT_BASECONTROL_H

#include "basecontrol/NaviSerialManager.h"
#include "ros/ros.h"
#include "ros/timer.h"
#include "ros/wall_timer.h"
#include "nav_msgs/Odometry.h"
#include "geometry_msgs/Twist.h"
#include "basecontrol/WheelStatus.h"
#include <climits>
#include <yaml-cpp/yaml.h>
#include <sys/time.h>
#include "basecontrol/JoyTeleop.h"
#include "geometry_msgs/PoseWithCovarianceStamped.h"
#include "tf/transform_datatypes.h"
#include "tf/transform_broadcaster.h"
#include "squat_planning/code_generation_active_motor.h"
#include <valarray>


class BaseController {
public:
    
    struct Encoder {
        int right_encoder;
        int left_encoder;
        double interval;
        bool encoderWrong;
    };
    struct Cmd_vel {
        char cmd_right_wheel;
        char cmd_left_wheel;
    };
    struct Base_model {
        double Wheel_Diameter{};
        double Encoder_to_Distance{};
        double Wheel_Base{};
        double Wheel_Center_X_Offset{};
        double Wheel_Center_Y_Offset{};
    };
    struct Joint_control {
        int left_ankle_vel;
        int left_knee_vel;
        int left_hip_vel;
        int right_ankle_vel;
        int right_knee_vel;
        int right_hip_vel;
        int left_ankle_angular;
        int left_knee_angular;
        int left_hip_angular;
        int right_ankle_angular;
        int right_knee_angular;
        int right_hip_angular;
    };
    enum Command{
        MOVEFORWARD,
        MOVEBACK,
        TURNLEFT,
        TURNRIGHT,
        GET_POSE,
        STOP
    };
private:
    std::tr1::shared_ptr<boost::thread> thread_ptr_;
    char wheel_vel[COMMAND_SIZE] = {0x53,0x13,0x10,0x03,0x00,0x00,0x00,0x00};
	unsigned char left_hip_lock[LOCK_SIZE] = {0x00,0x01,0x53,0x13,0x21,0x01,0x00,0x00,0x18,0x00};
	unsigned char left_hip1_lock[LOCK_SIZE] = {0x00,0x02,0x53,0x13,0x21,0x02,0x00,0x00,0x18,0x00};
	unsigned char left_knee_lock[LOCK_SIZE] = {0x00,0x04,0x53,0x13,0x21,0x04,0x00,0x00,0x15,0x00};
	unsigned char left_ankle_lock[LOCK_SIZE] = {0x00,0x07,0x53,0x13,0x21,0x07,0x00,0x00,0x18,0x00};

	unsigned char right_hip_lock[LOCK_SIZE] = {0x00,0x11,0x53,0x13,0x21,0x11,0x00,0x00,0x18,0x00};
	unsigned char right_hip1_lock[LOCK_SIZE] = {0x00,0x12,0x53,0x13,0x21,0x12,0x00,0x00,0x18,0x00};
	unsigned char right_knee_lock[LOCK_SIZE] = {0x00,0x14,0x53,0x13,0x21,0x14,0x00,0x00,0x15,0x00};
	unsigned char right_ankle_lock[LOCK_SIZE] = {0x00,0x17,0x53,0x13,0x21,0x17,0x00,0x00,0x1F,0x00};

	unsigned char turn_right[COMMAND_SIZE] = {0x53,0x13,0x10,0x03,0x00,0xdb,0xdb,0x00};	
	unsigned char turn_left[COMMAND_SIZE] = {0x53,0x13,0x10,0x03,0x00,0x25,0x25,0x00};
	unsigned char move_forward[COMMAND_SIZE] = {0x53,0x13,0x10,0x03,0x00,0xf0,0x10,0x00};
	unsigned char move_back[COMMAND_SIZE] = {0x53,0x13,0x10,0x03,0x00,0x10,0xf0,0x00};
	unsigned char stop_smooth[COMMAND_SIZE] = {0x53,0x13,0x10,0x03,0x00,0x00,0x00,0x00};
    unsigned char get_pos[COMMAND_SIZE] = {0x53,0x13,0x13,0x00,0x00,0x00,0x00,0x34};

    unsigned char control_vel[CONTROL_SIZE] = {0x93,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00, \
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00, \
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
    unsigned char steeringGoByAngle[COMMAND_SIZE]  ={0x53,0x02,0x40,0x02,0x00,0x00,0x00,0x00};
   
    const int TIMER_SPAN_RATE_ = 60;
    const int ODOM_TIMER_SPAN_RATE_ = 30;
    const std::string BASE_FOOT_PRINT_;
    const std::string ODOM_FRAME_;
    Encoder ENCODER_{};

    char message_[COMMAND_SIZE];

    ros::NodeHandle nh_;
    ros::Publisher wheel_status_pub;
    ros::Publisher odom_raw_pub;
    tf::TransformBroadcaster broad_caster;

    ros::Subscriber cmd_vel_sub;
    ros::Subscriber joy_vel_sub;

    ros::Timer timer_;
    ros::Timer odom_publish_timer_;
    
    ros::Time cmd_vel_watch_;
    ros::Time encoder_pre{}, encoder_after{}, encoder_stop{};

    Base_model BASE_MODEL_{};
    NaviSerialManager *serialManager;
    Cmd_vel user_cmd_vel{};

    double linear_velocity_{}, angular_velocity_{};
    double global_x{0.0}, global_y{0.0}, global_theta{0.0};

    bool joy_vel_received_{};
    bool cmd_vel_received_{};
    bool ThreadRegistered_;
    bool right_updated{},left_updated{};
    bool publish_tf_{};
    bool knife_right_end{},knife_left_end{};
    int battery;

    unsigned char xor_msgs(unsigned char* msg);
    void timerCallback(const ros::TimerEvent & e);
    void odom_publish_timer_callback(const ros::TimerEvent & e);
    void init_send_msgs();
    int parsingMsg();
    void odom_parsing();

    void joy_velCallback(const geometry_msgs::TwistConstPtr &msg);
    void cmd_velCallback(const geometry_msgs::TwistConstPtr &msg);
    void SquatThread(double rate);
    
    
    double angular_a[800],angular_k[800],angular_h[800];
    double angle_a[800],angle_k[800],angle_h[800];

public:
    BaseController(std::string serial_addr, unsigned int baudrate, std::string base_foot_print, std::string odom_frame,
                   bool publish_tf = false);
    ~BaseController();
    void sendVelocity(Cmd_vel user_cmd_vel);
    void send_joint_control(int i_);
    void sendCommand(Command user_command, double parameter = 0.0);
    void setBaseModel(const std::string &param_addr);
    void squat_planning();
    void joint_lock();
    void SquatController(double rate);
    bool NaviMode = true;
    bool ControlMode = false;
};
#endif
